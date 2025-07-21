# **Linux 권한 관리 실습 문제**

## **실습 환경 설정**

**먼저 다음 명령어들을 실행하여 루트 실습 환경을 구성하세요:**

- # 실습 디렉터리 생성
- mkdir permission_practice
- cd permission_practice
- 
- # 사용자 및 그룹 생성 (관리자 권한 필요)
- sudo useradd -m -s /bin/bash alice
- sudo useradd -m -s /bin/bash bob
- sudo useradd -m -s /bin/bash charlie
- sudo useradd -m -s /bin/bash diana
- sudo useradd -m -s /bin/bash eve
- 
- # 그룹 생성
- sudo groupadd developers
- sudo groupadd managers
- 
- # 사용자를 그룹에 추가
- sudo usermod -a -G developers alice
- sudo usermod -a -G developers bob
- sudo usermod -a -G developers charlie
- sudo usermod -a -G managers diana
- sudo usermod -a -G managers alice
- # eve는 기타 사용자로 어떤 그룹에도 속하지 않음
- 
- # 복잡한 디렉터리 구조 생성
- mkdir -p {company/{departments/{dev,hr,finance,marketing},projects/{project_a,project_b,project_c}},shared/{documents,resources,tools},private/{alice,bob,charlie,diana,eve},backup/{daily,weekly,monthly},logs/{2023/{01..12},2024/{01..12}}}
- 
- # 다양한 파일 생성
- touch company/departments/dev/{main.py,test.py,config.py,README.md}
- touch company/departments/hr/{employees.xlsx,contracts.pdf,policies.txt}
- touch company/departments/finance/{budget.xlsx,reports.pdf,invoices.csv}
- touch company/projects/project_a/{spec.doc,code.zip,data.json}
- touch company/projects/project_b/{requirements.txt,source.tar.gz,notes.md}
- touch shared/documents/{manual.pdf,guidelines.txt,templates.docx}
- touch shared/resources/{images.zip,fonts.tar,icons.png}
- touch private/alice/{personal.txt,settings.conf,backup.tar}
- touch private/bob/{notes.md,config.json,archive.zip}
- touch backup/daily/{backup_$(date +%Y%m%d).tar.gz,log_$(date +%Y%m%d).txt}
- touch logs/2024/06/{access.log,error.log,debug.log,system.log}
- 
- # 실행 가능한 스크립트 파일 생성
- echo '#!/bin/bash' > shared/tools/deploy.sh
- echo 'echo "Deployment script"' >> shared/tools/deploy.sh
- echo '#!/bin/bash' > shared/tools/backup.sh
- echo 'echo "Backup script"' >> shared/tools/backup.sh
- echo '#!/bin/bash' > company/departments/dev/build.sh
- echo 'echo "Build script"' >> company/departments/dev/build.sh
- 
- # 설정 파일 생성
- echo "database_host=localhost" > company/departments/dev/database.conf
- echo "api_key=secret123" > company/departments/dev/api.conf
- echo "salary_data=confidential" > company/departments/hr/salaries.txt
- 
- echo "실습 환경이 구성되었습니다!"
- tree permission_practice

---

## **1. 기본 권한 설정**

```bash
alice:x:1002:1004::/home/alice:/bin/bash
bob:x:1003:1005::/home/bob:/bin/bash
charlie:x:1004:1006::/home/charlie:/bin/bash
diana:x:1005:1007::/home/diana:/bin/bash
eve:x:1006:1008::/home/eve:/bin/bash
```

```bash
devs:x:1001:
interns:x:1002:
alice:x:1004:
bob:x:1005:
charlie:x:1006:
diana:x:1007:
eve:x:1008:
developers:x:1009:alice,bob,charlie
manager:x:1010:
managers:x:1011:diana,alice
```

### **1-1. 개발팀 파일 권한 설정**

개발팀(developers 그룹) 관련 파일들의 권한을 다음과 같이 설정하세요:

- company/departments/dev/ 디렉터리: 개발팀만 접근 가능, 소유자와 그룹은 읽기/쓰기/실행 가능
- company/departments/dev/main.py: 개발팀은 읽기/쓰기, 기타(other)는 읽기만 가능
- company/departments/dev/build.sh: 개발팀만 실행 가능

**명령어를 작성하세요:**

- # 1-1 답안 작성란

```bash
# 개발자 팀 디렉토리 그룹 변경
sudo chgrp -R developers company/departments/dev

# 개발자 팀 ailce가 디렉토리 소유자로 변경
sudo chown -R alice company/departments/dev

# 소유자와 그룹은 읽기/쓰기/실행 가능
sudo chmod -R 770 company/departments/dev/

[alice@localhost permission_practice]$ ls -l company/departments/dev
total 12
-rwxrwx---. 1 alice developers 18 Jul 21 16:50 api.conf
-rwxrwx---. 1 alice developers 32 Jul 21 16:50 build.sh
-rwxrwx---. 1 alice developers  0 Jul 21 16:49 config.py
-rwxrwx---. 1 alice developers 24 Jul 21 16:50 database.conf
-rwxrwx---. 1 alice developers  0 Jul 21 16:49 main.py
-rwxrwx---. 1 alice developers  0 Jul 21 16:49 README.md
-rwxrwx---. 1 alice developers  0 Jul 21 16:49 test.py
---

[root@localhost permission_practice]# chmod 764 -R company/departments/dev/main.py
[root@localhost permission_practice]# ls -l company/departments/dev/main.py
-rwxrw-r--. 1 alice developers 0 Jul 21 16:49 company/departments/dev/main.py

---
[root@localhost permission_practice]# chmod 550 -R company/departments/dev/build.sh

[alice@localhost permission_practice]$ ./company/departments/dev/build.sh
Build script

```

### **1-2. 개인 디렉터리 보안 설정**

각 사용자의 개인 디렉터리와 파일을 다음과 같이 설정하세요:

- private/alice/ 디렉터리: alice만 접근 가능
- private/alice/personal.txt: alice만 읽기/쓰기 가능
- private/bob/config.json: bob만 읽기/쓰기 가능

**명령어를 작성하세요:**

- # 1-2 답안 작성란

```bash
[root@localhost permission_practice]# chown -R alice private/alice
[root@localhost permission_practice]# ls -l private/alice/
total 0
-rw-r--r--. 1 alice root 0 Jul 21 16:50 backup.tar
-rw-r--r--. 1 alice root 0 Jul 21 16:50 personal.txt
-rw-r--r--. 1 alice root 0 Jul 21 16:50 settings.conf
[root@localhost permission_practice]# chmod 700 private/alice/
---
[root@localhost permission_practice]# chmod 600 private/alice/personal.txt 
---
[root@localhost permission_practice]# chown -R bob private/bob/config.json 
[root@localhost permission_practice]# chmod 600 private/bob/config.json 
[root@localhost permission_practice]# ls -l private/bob/config.json 
-rw-------. 1 bob root 0 Jul 21 16:50 private/bob/config.json

```

---

## **2. 그룹 기반 권한 관리**

### **2-1. 공유 리소스 접근 권한**

shared/ 디렉터리의 권한을 다음과 같이 설정하세요:

- shared/documents/: developers와 managers 그룹 모두 읽기 가능, 소유자만 쓰기 가능
- shared/resources/: developers 그룹만 접근 가능
- shared/tools/: 모든 사용자가 읽기 가능, developers 그룹만 실행 가능

**명령어를 작성하세요:**

- # 2-1 답안 작성란

```bash
[root@localhost permission_practice]# setfacl -R -m g:developers:r-- shared/documents/
[root@localhost permission_practice]# setfacl -R -m g:managers:r-- shared/documents/
[root@localhost permission_practice]# setfacl -R -m u:root:rw-- shared/documents/
[root@localhost permission_practice]# getfacl shared/documents/
# file: shared/documents/
# owner: root
# group: root
user::rwx
user:root:rw-
group::r-x
group:developers:r--
group:managers:r--
mask::rwx
other::r-x

```

### **2-2. 프로젝트별 협업 권한**

프로젝트 디렉터리의 권한을 다음과 같이 설정하세요:

- company/projects/project_a/: developers 그룹 구성원들이 협업할 수 있도록 설정
- company/projects/project_b/: alice와 bob만 접근 가능하도록 설정

**명령어를 작성하세요:**

- # 2-2 답안 작성란

```bash
[root@localhost permission_practice]# chmod -R 770 company/projects/project_a
[root@localhost permission_practice]# chgrp -R developers company/projects/project_a

```

---

## **3. 고급 권한 설정**

### **3-1. 특수 권한 적용**

다음 파일들에 특수 권한을 설정하세요:

- shared/tools/deploy.sh: SetGID 설정으로 developers 그룹 권한으로 실행
- ~~backup/ 디렉터리: Sticky Bit 설정으로 파일 소유자만 삭제 가능~~
- company/departments/hr/salaries.txt: SetUID 설정 (실제 환경에서는 권장하지 않지만 실습용)

**명령어를 작성하세요:**

- # 3-1 답안 작성란

```bash
[root@localhost permission_practice]# setfacl -R -m u:alice:rwx-- company/projects/project_a
[root@localhost permission_practice]# setfacl -R -m u:bob:rwx-- company/projects/project_a[root@localhost permission_practice]# setfacl -R -m u:charlie:rwx-- company/projects/project_a
[root@localhost permission_practice]# setfacl -R -m u:charlie:rwx-- company/projects/project_a
[root@localhost permission_practice]# chmod -R 770 company/projects/project_a
[root@localhost permission_practice]# getfacl company/projects/project_a
# file: company/projects/project_a
# owner: root
# group: developers
user::rwx
user:alice:rwx
user:bob:rwx
user:charlie:rwx
group::rwx
mask::rwx
other::---

```

### **3-2. 숫자 표기법으로 복합 권한 설정**

다음 파일들의 권한을 숫자 표기법으로 설정하세요:

- company/departments/finance/budget.xlsx: 소유자(rw-), 그룹(r--), 기타(---)
- shared/documents/manual.pdf: 소유자(rw-), 그룹(r--), 기타(r--)
- logs/2024/06/system.log: 소유자(rw-), 그룹(r--), 기타(---)

**명령어를 작성하세요:**

- # 3-2 답안 작성란

```bash
chmod -R 640 company/departments/finance/budget.xlsx
chmod -R 644 shared/documents/manual.pdf
chmod -R 640 logs/2024/06/system.log
```

---

## **4. 소유권 및 그룹 관리**

### **4-1. 소유권 변경**

다음과 같이 파일과 디렉터리의 소유권을 변경하세요:

- company/departments/dev/ 디렉터리와 모든 하위 파일: alice 소유, developers 그룹
- company/departments/hr/ 디렉터리와 모든 하위 파일: diana 소유, managers 그룹
- shared/tools/ 디렉터리와 모든 하위 파일: root 소유, developers 그룹

**명령어를 작성하세요:**

- # 4-1 답안 작성란

```bash
chown -R alice:developers company/departments/dev/ 

chown -R diana:managers company/departments/hr/

chown -R root:developers shared/tools/ 
```

### **4-2. 그룹 전용 변경**

다음 디렉터리들의 그룹만 변경하세요:

- company/projects/: managers 그룹으로 변경
- backup/daily/: developers 그룹으로 변경

**명령어를 작성하세요:**

- # 4-2 답안 작성란

```bash
chgrp -R managers company/projects

chgrp -R developers backup/daily
```

---

## **6. umask 및 기본 권한 관리**

### **6-1. umask 설정 및 테스트**

현재 시스템의 umask 값을 확인하고 다음과 같이 변경한 후 테스트하세요:

- umask 값을 027로 설정
- 새 파일과 디렉터리를 생성하여 기본 권한 확인
- 원래 umask 값으로 복원

**명령어를 작성하세요:**

- # 6-1 답안 작성란

```bash
# 현재 umask 값 확인
echo "현재 umask: $(umask)"

# umask 값을 027로 설정
umask 027

# 새 파일과 디렉터리 생성하여 기본 권한 확인
mkdir test_dir
touch test_file
ls -l test_dir test_file

# 원래 umask 값으로 복원
umask 022

```

### **6-2. 사용자별 umask 커스터마이징**

각 사용자별로 다른 umask 값을 설정하세요:

- alice: umask 022 (일반적인 개발자 설정)
- diana: umask 077 (보안 강화 설정)
- eve: umask 002 (그룹 협업 친화적 설정)

**명령어를 작성하세요:**

- # 6-2 답안 작성란
- 
- 

---

## **8. 실행 권한 및 스크립트 관리**

### **8-1. 스크립트 실행 환경 설정**

다음 스크립트 파일들의 실행 권한을 적절히 설정하세요:

- shared/tools/deploy.sh: developers 그룹만 실행 가능
- shared/tools/backup.sh: alice와 diana만 실행 가능 (ACL 사용)
- company/departments/dev/build.sh: 소유자만 실행 가능

**명령어를 작성하세요:**

- # 8-1 답안 작성란

```bash
chgrp developers shared/tools/deploy.sh
chmod 750 shared/tools/deploy.sh

setfacl -m u:alice:rwx shared/tools/backup.sh
setfacl -m u:diana:rwx shared/tools/backup.sh
setfacl -m g::--- shared/tools/backup.sh
setfacl -m o::--- shared/tools/backup.sh

chmod 700 company/departments/dev/build.sh
```

### **8-2. 시스템 스크립트 보안 설정**

시스템 관리용 스크립트를 다음과 같이 설정하세요:

- root 소유의 시스템 관리 스크립트 생성 (system_check.sh)
- 일반 사용자가 sudo 없이 실행할 수 있도록 SetUID 설정
- 실행 로그를 남기도록 권한 설정

**명령어를 작성하세요:**

- # 8-2 답안 작성란

```bash
# root 소유의 시스템 관리 스크립트 생성
cat > system_check.sh << 'EOF'
#!/bin/bash
echo "$(date): 시스템 검사 실행됨 - 사용자: $(who am i)" >> /var/log/system_check.log
echo "디스크 사용량 확인 중..."
df -h
echo "메모리 상태 확인 중..."
free -h
echo "프로세스 상태 확인 중..."
ps aux | head -10
echo "$(date): 시스템 검사 완료 - 사용자: $(who am i)" >> /var/log/system_check.log
EOF

# 스크립트 소유자를 root로 설정
chown root:root system_check.sh

# SetUID 설정으로 일반 사용자가 sudo 없이 실행 가능
chmod u+s system_check.sh
chmod 755 system_check.sh

# 로그 파일 생성 및 권한 설정
touch /var/log/system_check.log
chown root:root /var/log/system_check.log
chmod 644 /var/log/system_check.log

```

---

## **9. 디렉터리별 접근 제어**

### **9-1. 계층적 접근 제어**

다음과 같은 계층적 접근 권한을 설정하세요:

- company/ : 모든 직원이 읽기 가능
- company/departments/ : 각 부서원만 해당 부서 디렉터리 접근 가능
- company/departments/finance/ : managers 그룹만 접근 가능
- company/projects/ : 프로젝트 참여자만 해당 프로젝트 접근 가능

**명령어를 작성하세요:**

- # 9-1 답안 작성란

```bash
# company/: 모든 직원이 읽기 가능
chmod 755 company

# company/departments/: 기본 접근 권한 설정
chmod 755 company/departments

# company/departments/dev/: developers 그룹만 접근 (이미 설정됨)
# (1-1에서 이미 설정했으므로 확인만)
ls -ld company/departments/dev

# company/departments/hr/: managers 그룹만 접근
chgrp managers company/departments/hr
chmod 750 company/departments/hr

# company/departments/finance/: managers 그룹만 접근 가능
chgrp managers company/departments/finance
chmod 750 company/departments/finance

# company/departments/marketing/: 일반 직원도 접근 가능
chmod 755 company/departments/marketing

# company/projects/: 프로젝트 참여자만 접근 (이미 설정됨)
# project_a는 developers, project_b는 alice+bob 전용으로 이미 설정
ls -ld company/projects/project_*

# 세부 권한 추가 설정
setfacl -m g:developers:rx company/departments
setfacl -m g:managers:rx company/departments

```

### **9-2. 임시 작업 공간 설정**

임시 작업을 위한 공간을 다음과 같이 설정하세요:

- temp/ 디렉터리 생성 (모든 사용자가 파일 생성 가능)
- Sticky Bit 설정으로 자신의 파일만 삭제 가능
- 1주일 후 자동 삭제되도록 권한 설정 (cron 작업용)

**명령어를 작성하세요:**

- # 9-2 답안 작성란

```bash
mkdir temp
chmod 777 temp

# 1주일 후 자동 삭제를 위한 cron 스크립트 생성
cat > /usr/local/bin/cleanup_temp.sh << 'EOF'
#!/bin/bash
# 7일 이상 된 파일을 temp 디렉터리에서 삭제
find /root/permission_practice/temp -type f -mtime +7 -delete
# 빈 디렉터리도 7일 후 삭제
find /root/permission_practice/temp -type d -empty -mtime +7 -delete
# 로그 기록
echo "$(date): temp 디렉터리 정리 완료" >> /var/log/temp_cleanup.log
EOF

# 정리 스크립트 실행 권한 부여
chmod +x /usr/local/bin/cleanup_temp.sh

# cron 작업 등록 (매일 새벽 2시에 실행)
(crontab -l 2>/dev/null; echo "0 2 * * * /usr/local/bin/cleanup_temp.sh") | crontab -

# 로그 파일 생성
touch /var/log/temp_cleanup.log
chmod 644 /var/log/temp_cleanup.log
```

---

## **10. 백업 및 아카이브 권한 관리**

### **10-1. 백업 파일 보안**

백업 관련 파일들의 보안을 다음과 같이 설정하세요:

- backup/daily/ : developers 그룹이 백업 생성 가능, 읽기 전용
- backup/weekly/ : managers만 접근 가능
- backup/monthly/ : root만 접근 가능
- 모든 백업 파일은 생성 후 읽기 전용으로 자동 변경

**명령어를 작성하세요:**

- # 10-1 답안 작성란

```bash
chgrp -R developers backup/daily
chmod 750 backup/daily
chmod 640 backup/daily/*

chgrp -R managers backup/weekly
chmod 750 backup/weekly

chmod 700 backup/monthly

# 모든 백업 파일은 읽기 전용으로 설정
find backup/ -type f -exec chmod 440 {} \;

```

---