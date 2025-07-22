## **🧪 환경 변수 및 초기화 스크립트 실습 문제**

### **🔹 문제 1. 로그인 시마다 "Welcome, USERNAME" 메시지를 출력하시오.**

**조건:**

- 현재 로그인한 사용자명을 포함할 것 ($USER)
- **로그인할 때마다 자동으로 출력**되도록 설정할 것

```bash
hwang@localhost ~]$ nano ~/.bashrc
[hwang@localhost ~]$ cat ~/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
PS1="[\u@\h \w]\$ "
echo "Welcom, $USER"
---

# 확인
[hwang@localhost ~]$ su - hwang
Password: 
Welcom, hwang
```

---

### **🔹 문제 2. 로그인 시 사용자의 Downloads/ 폴더 내 일반 파일을 삭제하시오.**

**조건:**

- 경로: ~/Downloads/
- **일반 파일만 삭제** (서브디렉토리, 숨김파일은 삭제하지 않음)
- **로그인 시 자동 실행**

```bash
hwang@localhost ~]$ cat ~/.bashrc
~~~~

unset rc
PS1="[\u@\h \w]\$ "
echo "Welcom, $USER"
# 추가
find ~/Downloads/ -maxdepth 1 -type f -not -name ".*" -delete 2>/dev/null

---

[hwang@localhost ~]$ su - hwang
Password: 
Welcom, hwang
[hwang@localhost ~]$ ls -la Downloads/
total 4
drwxr-xr-x. 3 hwang hwang   22 Jul 22 11:56 .
drwx------. 7 hwang hwang 4096 Jul 22 11:56 ..
drw-rw-rw-. 2 hwang hwang    6 Jul 22 11:51 test_dir
```

---

### **🔹 문제 3. 로그인할 때마다 ~/Downloads/ 경로에 다음 구조로 디렉토리 및 파일을 자동 생성하도록 설정하시오.**

**생성 구조:**

- ~/Downloads/
- └── auto_created/
- ├── info.txt
- └── logs/
- └── log.txt

**조건:**

- 파일에는 임의의 간단한 문자열이 들어갈 것
- **매 로그인마다 자동 생성**

```bash
[hwang@localhost ~]$ cat ~/.bashrc
~~~~
unset rc
PS1="[\u@\h \w]\$ "
echo "Welcom, $USER"
find ~/Downloads/ -maxdepth 1 -type f -not -name ".*" -delete 2>/dev/null
# 추가
mkdir ~/Downloads/{auto_created,logs} && echo "info" > ~/Downloads/info.txt &&  echo "log" > ~/Downloads/log.txt
---

[hwang@localhost ~]$ su - hwang
Password: 
Welcom, hwang
[hwang@localhost ~]$ ls -la Downloads/
total 12
drwxr-xr-x. 5 hwang hwang   85 Jul 22 12:08 .
drwx------. 7 hwang hwang 4096 Jul 22 12:08 ..
drwxr-xr-x. 2 hwang hwang    6 Jul 22 12:08 auto_created
-rw-r--r--. 1 hwang hwang    5 Jul 22 12:08 info.txt
drwxr-xr-x. 2 hwang hwang    6 Jul 22 12:08 logs
-rw-r--r--. 1 hwang hwang    4 Jul 22 12:08 log.txt
drw-rw-rw-. 2 hwang hwang    6 Jul 22 11:51 test_dir

```

---

### **🔹 문제 4. /etc/profile을 수정하여, 로그인 시 모든 사용자에게 공지 메시지 /etc/login_notice.txt를 출력하도록 설정하시오.**

**조건:**

- 출력 방식은 cat, echo 등 자유
- 시스템 전체 사용자에게 적용
- /etc/login_notice.txt는 임의의 내용을 사전에 작성해 둘 것
- sudo 권한 필요

```bash
[hwang@localhost ~]$ sudo nano /etc/login_notice.txt
[sudo] password for hwang: 
[hwang@localhost ~]$ sudo nano /etc/profile
[hwang@localhost ~]$ sudo chmod 644 /etc/login_notice.txt
sudo chown root:root /etc/login_notice.txt
[hwang@localhost ~]$ 
---
[hwang@localhost ~]$ su - hwang
Password: 
notice message!!
Welcom, hwang
mkdir: cannot create directory ‘/home/hwang/Downloads/auto_created’: File exists
mkdir: cannot create directory ‘/home/hwang/Downloads/logs’: File exists
# 공지 메시지
notice message!!
[hwang@localhost ~]$ cat  /etc/profile
~~~~~

if [ -f /etc/login_notice.txt ]; then
    cat /etc/login_notice.txt
fi

```

---