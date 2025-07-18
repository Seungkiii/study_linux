# Linux 실습 문제지 - nano, 쉘 스크립트, 다중 명령어, chmod

## 기본 개념 정리

### nano 편집기

- **nano** : 터미널 기반 텍스트 편집기
- **Ctrl+X** : 편집기 종료
- **Ctrl+O** : 파일 저장
- **Ctrl+K** : 현재 줄 잘라내기
- **Ctrl+U** : 잘라낸 텍스트 붙여넣기

### 쉘 스크립트 기본

- **~~#!/bin/bash** : 쉘 스크립트 시작 라인 (shebang)~~
- **실행 권한** : chmod +x 파일명
- **실행 방법** : ./파일명 또는 bash 파일명

### 다중 명령어 연산자

- **&&** : 앞 명령어가 성공하면 뒤 명령어 실행
- **~~||** : 앞 명령어가 실패하면 뒤 명령어 실행~~
- **~~;** : 앞 명령어 결과와 관계없이 순차 실행~~

### chmod 권한 설정

- **r(읽기)** : 4, **w(쓰기)** : 2, **x(실행)** : 1
- **755** : 소유자(rwx), 그룹(rx), 기타(rx)
- **644** : 소유자(rw), 그룹(r), 기타(r)
- 실행을 하려면 읽기 권한도 필요함

## 실습 환경 설정

먼저 다음 명령어를 실행하여 실습 환경을 만들어보세요:

```bash
mkdir shell_practice

cd shell_practice

touch hello.sh backup.sh system_info.txt

touch data1.txt data2.txt notes.md

mkdir scripts logs temp
```

## 문제 1: nano 편집기 사용

### 1-1. 기본 파일 생성 및 편집

hello.sh 파일을 nano로 열어 다음 내용을 작성하세요:

#!/bin/bash

echo "안녕하세요! 리눅스 세계에 오신 것을 환영합니다."

**명령어를 작성하세요:**

# nano 편집기로 hello.sh 파일 열기

```bash
ㅜㅁnano hello.sh
# 복붙
#!/bin/bash

echo "안녕하세요! 리눅스 세계에 오신 것을 환영합니다."

[hwang@localhost shell_practice]$ cat hello.sh 
#!/bin/bash

echo "안녕하세요! 리눅스 세계에 오신 것을 환영합니다."

```

### 1-2. 파일 내용 수정

system_info.txt 파일을 nano로 열어 현재 시스템 정보를 기록하는 내용을 작성하세요.

**명령어를 작성하세요:**

# nano 편집기로 system_info.txt 파일 열기

```bash
# 시스템 정보
hostnamectl
# 파일 열고 시스템 정보 붙이기
nano system_info.txt 
[hwang@localhost shell_practice]$ cat system_info.txt 
   Static hostname: (unset)                           
Transient hostname: localhost
         Icon name: computer-vm
           Chassis: vm 🖴
        Machine ID: 8ec27dfa72514ca7ba84d674260bc406
           Boot ID: 89dd609a83aa413bb022f4abb07aa68e
    Virtualization: vmware
  Operating System: Rocky Linux 9.6 (Blue Onyx)       
       CPE OS Name: cpe:/o:rocky:rocky:9::baseos
            Kernel: Linux 5.14.0-570.17.1.el9_6.x86_64
      Architecture: x86-64
   Hardware Vendor: VMware, Inc.
    Hardware Model: VMware Virtual Platform
  Firmware Version: 6.00

```

## 문제 2: 쉘 스크립트 작성 및 실행

### 2-1. 기본 쉘 스크립트 작성

backup.sh 파일을 만들어 다음 기능을 수행하는 스크립트를 작성하세요:

- 현재 날짜 출력
- "백업을 시작합니다" 메시지 출력
- 현재 디렉터리의 파일 목록 출력

**명령어를 작성하세요:**

# nano로 backup.sh 파일 생성 및 편집

```bash
[hwang@localhost shell_practice]$ nano backup.sh 
[hwang@localhost shell_practice]$ cat backup.sh 
date
#!/bin/bash
echo "백업을 시작합니다"
pwd

```

### 2-2. 스크립트 실행 권한 부여

backup.sh 파일에 실행 권한을 부여하세요.

**명령어를 작성하세요:**

# backup.sh 파일에 실행 권한 부여

```bash
[hwang@localhost shell_practice]$ chmod 100 backup.sh 
[hwang@localhost shell_practice]$ ls -l backup.sh 
---x------. 1 hwang hwang 54 Jul 18 17:16 backup.sh
```

### 2-3. 스크립트 실행

작성한 backup.sh 스크립트를 실행하세요.

**명령어를 작성하세요:**

# backup.sh 스크립트 실행

```bash
[hwang@localhost shell_practice]$ ./backup.sh 
bash: ./backup.sh: Permission denied
[hwang@localhost shell_practice]$ chmod 500 backup.sh 
[hwang@localhost shell_practice]$ ./backup.sh 
Fri Jul 18 05:18:23 PM KST 2025
백업을 시작합니다
/home/hwang/Downloads/shell_practice
```

## 문제 3: && 연산자를 이용한 다중 명령어

### 3-1. 조건부 실행

디렉터리 생성이 성공하면 해당 디렉터리로 이동하는 명령어를 작성하세요.

**명령어를 작성하세요:**

# new_project 디렉터리 생성 후 성공하면 이동

```bash
[hwang@localhost shell_practice]$ mkdir new_project && cd ./new_project
[hwang@localhost new_project]$ 
```

### 3-2. 파일 생성 및 편집

test.txt 파일을 생성하고 성공하면 nano로 편집하는 명령어를 작성하세요.

**명령어를 작성하세요:**

# test.txt 파일 생성 후 성공하면 nano로 편집

```bash
[hwang@localhost shell_practice]$ touch test.txt && nano test.txt
[hwang@localhost shell_practice]$ cat test.txt 
Success!!
```

### 3-3. 복합 조건부 실행

스크립트 파일을 생성하고, 실행 권한을 부여한 후, 실행하는 일련의 명령어를 작성하세요.

**명령어를 작성하세요:**

# quick_test.sh 파일에 "echo 'Hello World'" 내용 저장 후 실행 권한 부여 후 실행

```bash
[hwang@localhost shell_practice]$ echo "echo Hello World" > quick_test.sh && chmod 500 quick_test.sh
[hwang@localhost shell_practice]$ ls -l quick_test.sh 
-r-x------. 1 hwang hwang 17 Jul 18 17:22 quick_test.sh
```

## 문제 4: chmod를 이용한 권한 조정

### 4-1. 기본 권한 설정

test_script.sh 파일을 생성하고 소유자에게만 모든 권한을 부여하세요.

**명령어를 작성하세요:**

# test_script.sh 파일 생성

# 소유자에게만 읽기, 쓰기, 실행 권한 부여 (700)

```bash
[hwang@localhost shell_practice]$ touch test_script.sh && chmod 700 test_script.sh
[hwang@localhost shell_practice]$ ls -l test_script.sh 
-rwx------. 1 hwang hwang 0 Jul 18 17:23 test_script.sh
```

### 4-2. 그룹 권한 추가

test_script.sh 파일에 그룹 사용자에게 읽기 및 실행 권한을 추가하세요.

**명령어를 작성하세요:**

# 그룹에 읽기, 실행 권한 추가 (750)

```bash
[hwang@localhost shell_practice]$ ls -l test_script.sh 
-rwxr-x---. 1 hwang hwang 0 Jul 18 17:23 test_script.sh
```

### 4-3. 권한 확인

파일의 현재 권한을 확인하는 명령어를 작성하세요.

**명령어를 작성하세요:**

# 파일 권한 확인

```bash
ls -l [파일명]

# 더 자세한 권한 확인
[hwang@localhost shell_practice]$ stat test_script.sh 
  File: test_script.sh
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d	Inode: 35692938    Links: 1
Access: (0750/-rwxr-x---)  Uid: ( 1000/   hwang)   Gid: ( 1000/   hwang)
Context: unconfined_u:object_r:user_home_t:s0
Access: 2025-07-18 17:23:30.303682894 +0900
Modify: 2025-07-18 17:23:30.303682894 +0900
Change: 2025-07-18 17:24:27.232415432 +0900
 Birth: 2025-07-18 17:23:30.303682894 +0900

```

### 4-4. 실행 권한 제거

test_script.sh 파일에서 모든 사용자의 실행 권한을 제거하세요.

**명령어를 작성하세요:**

# 모든 사용자의 실행 권한 제거

```bash
chmod 000 test_script.sh
```

## 문제 5: 종합 실습

### 5-1. 자동화 스크립트 작성

다음 기능을 수행하는 setup.sh 스크립트를 작성하세요:

1. logs 디렉터리가 없으면 생성
2. 현재 날짜와 시간을 logs/setup.log 파일에 기록
3. "설정 완료" 메시지 출력

**작성할 스크립트 내용:**

#!/bin/bash

# setup.sh 스크립트 내용을 작성하세요

```bash
[hwang@localhost shell_practice]$ nano setup.sh
[hwang@localhost shell_practice]$ cat setup.sh 
#!/bin/bash
mkdir -p logs
date "+%Y-%m-%d %H:%M:%S" >> logs/setup.log
echo "설정 완료"
```

### 5-2. 스크립트 실행 및 검증

setup.sh 스크립트를 실행하고, 로그 파일이 제대로 생성되었는지 확인하는 명령어를 작성하세요.

**명령어를 작성하세요:**

# setup.sh 실행 권한 부여 후 실행하고, 로그 파일 내용 확인

```bash
[hwang@localhost shell_practice]$ chmod 700 setup.sh 
[hwang@localhost shell_practice]$ ./setup.sh 
설정 완료
[hwang@localhost shell_practice]$ tree
.
├── backup.sh
├── data1.txt
├── data2.txt
├── hello.sh
├── logs
│   └── setup.log
├── new_project
├── notes.md
├── quick_test.sh
├── scripts
├── setup.sh
├── system_info.txt
├── temp
├── test_script.sh
└── test.txt

4 directories, 11 files
[hwang@localhost shell_practice]$ cat logs/setup.log 
2025-07-18 17:34:48

```

## 문제 6: 오류 처리 및 조건부 실행

### 6-1. 파일 존재 확인

important.txt 파일이 존재하면 백업을 생성하고, 존재하지 않으면 "파일이 없습니다" 메시지를 출력하는 명령어를 작성하세요.

**명령어를 작성하세요:**

# important.txt 파일이 존재하면 백업 생성, 없으면 오류 메시지 출력

```bash
[hwang@localhost shell_practice]$ [ -f important.txt ] touch important_backup.txt || echo "The file doesn't hava here"
bash: [: missing `]'
The file doesn't hava here
```

### 6-2. 디렉터리 이동 및 파일 생성

backup 디렉터리로 이동이 성공하면 현재 시간을 기록한 timestamp.txt 파일을 생성하세요.

**명령어를 작성하세요:**

# backup 디렉터리로 이동 후 성공하면 timestamp.txt 파일 생성

```bash
[hwang@localhost shell_practice]$ cd backup && echo "date "+%Y-%m-%d %H:%M:%S"" > timestamp.txt
[hwang@localhost backup]$ cat timestamp.txt 
date +%Y-%m-%d %H:%M:%S
```

### **🔧 문제 7: 조건문과 사용자 입력 활용**

### **7-1. 사용자 입력에 따라 동작하는 스크립트 작성**

greeting.sh 파일을 작성하여, 사용자에게 이름을 입력받고 다음과 같이 출력되도록 하세요:

bash

복사편집

안녕하세요, [입력한 이름]님!

작성할 명령어:

bash

복사편집

# greeting.sh 생성 및 편집

```bash
[hwang@localhost shell_practice]$ nano greeting.sh 
[hwang@localhost shell_practice]$ cat greeting.sh 
#!/bin/bash

# 사용자에게 이름 입력받기
read -p "이름을 입력하세요: " name

# 인사 메시지 출력
echo "안녕하세요, ${name}님!"

[hwang@localhost shell_practice]$ chmod 700 greeting.sh 
[hwang@localhost shell_practice]$ ./greeting.sh 
이름을 입력하세요: hwang
안녕하세요, hwang님!

```

### **7-2. 조건문을 이용한 인사 시간대 구분**

time_greet.sh 스크립트를 작성하여 현재 시간을 기준으로 다음 조건에 따라 메시지를 출력하세요:

- 5시~11시: "좋은 아침입니다."
- 12시~17시: "좋은 오후입니다."
- 그 외: "좋은 저녁입니다."

작성할 명령어:

bash

복사편집

# time_greet.sh 생성 및 편집

```bash
[hwang@localhost shell_practice]$ touch time_greet.sh
[hwang@localhost shell_practice]$ nano time_greet.sh 
[hwang@localhost shell_practice]$ cat time_greet.sh 
#!/bin/bash

hour=$(date +%H)

if ["$hour" -ge 5 ]&& ["$hour" -ge 11 ]; then 
	echo "좋은 아침입니다."
elif ["$hour" -ge 12 ]&& ["$hour" -le 17 ]; then 
	echo "좋은 오후입니다"
else
	echo "좋은 저녁입니다."
fi
[hwang@localhost shell_practice]$ chmod 700 time_greet.sh 
[hwang@localhost shell_practice]$ ./time_greet.sh 
./time_greet.sh: line 5: [17: command not found
./time_greet.sh: line 7: [17: command not found
좋은 저녁입니다.

```