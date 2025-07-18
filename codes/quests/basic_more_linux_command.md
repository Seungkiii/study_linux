## 연습문제 1: 기본 파일 시스템 탐색

[명령어 보기](/codes/quests/linux_quest1.sh)

### **1-1. 현재 위치 확인 및 이동**

1. 현재 작업 디렉터pw리의 절대 경로를 출력하시오.
2. 홈 디렉터리로 이동하시오.
3. 루트 디렉터리(/)로 이동하시오.
4. 다시 홈 디렉터리로 돌아가시오.

### **1-2. 디렉터리 내용 확인**

1. 현재 디렉터리의 파일과 폴더 목록을 출력하시오
2. 숨김 파일을 포함한 모든 파일의 상세 정보를 출력하시오.
3. /etc 디렉터리의 내용을 확인하시오.

## **연습문제 2: 디렉터리 및 파일 생성**

[명령어 보기](/codes/quests/linux_quest2.sh)

### **2-1. 디렉터리 구조 생성**

다음과 같은 디렉터리 구조를 생성하시오:

practice/

├── documents/

│   ├── reports/ls

│   └── notes/

├── images/

└── backup/””

### **2-2. 파일 생성 및 내용 작성**

1. practice/documents/ 디렉터리에 readme.txt 파일을 생성하고 "Hello Linux!"라는 내용을 작성하시오.
2. practice/notes/ 디렉터리에 memo.txt 파일을 생성하고 "Linux 명령어 연습 중"이라는 내용을 작성하시오.

## **연습문제 3: 파일 내용 확인 및 조작**

[명령어 보기](/codes/quests/linux_quest3.sh)

### **3-1. 파일 내용 출력**

1. 앞서 생성한 readme.txt 파일의 내용을 출력하시오.
2. memo.txt 파일의 내용을 출력하시오.

### **3-2. 파일 복사**

1. readme.txt 파일을 backup/ 디렉터리에 복사하시오.
2. documents/ 디렉터리 전체를 backup/ 디렉터리에 복사하시오.

## **연습문제 4: 파일 이동 및 이름 변경**

[명령어 보기](/codes/quests/linux_quest4.sh)

### **4-1. 파일 이동**

1. 파일을 documents/ 디렉터리로 이동하시오.
2. images/ 디렉터리를 practice/media/로 이름을 변경하시오.

### **4-2. 파일 이름 변경**

1. readme.txt를 introduction.txt로 이름을 변경하시오.
2. memo.txt를 study_notes.txt로 이름을 변경하시오.

## **연습문제 5: 종합 실습**

[명령어 보기](/codes/quests/linux_quest5.sh)

### **5-1. 프로젝트 디렉터리 생성**

다음 요구사항에 따라 프로젝트 디렉터리를 생성하시오:

1. my_project/라는 최상위 디렉터리 생성
2. 하위에 src/, docs/, tests/, config/ 디렉터리 생성
3. src/ 디렉터리에 main.py 파일 생성 (내용: "# Main Python File")
4. docs/ 디렉터리에 README.md 파일 생성 (내용: "# My Project Documentation")
5. config/ 디렉터리에 settings.conf 파일 생성 (내용: "# Configuration File")

### **5-2. 백업 및 정리**

1. 전체 my_project/ 디렉터리를 my_project_backup/으로 복사하시오.
2. my_project/src/main.py 파일을 my_project/src/app.py로 이름을 변경하시오.
3. my_project/docs/README.md 파일을 my_project/ 디렉터리로 이동하시오.