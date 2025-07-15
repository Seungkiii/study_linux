# **기본 명령어 연습 문제**

---

## **📁 Level 1: 기본 탐색 및 폴더 조작**

### **문제 1-1: 현재 위치 확인**

- **현재 작업 중인 디렉터리의 경로를 확인하세요**

### **문제 1-2: 폴더 구조 만들기**

**다음 폴더 구조를 생성하세요:**

**powershell_practice/**

**├── documents/**

**├── images/**

**├── backup/**

**└── temp/**

### **문제 1-3: 폴더 탐색**

- **documents 폴더로 이동하세요**
- **현재 폴더의 내용을 확인하세요 (비어있을 것입니다)**
- **다시 상위 폴더로 돌아가세요**

---

## **📄 Level 2: 파일 생성 및 조작**

### **문제 2-1: 텍스트 파일 생성**

- **documents 폴더에 hello.txt 파일을 생성하고 "Hello PowerShell!" 내용을 입력하세요**
- **images 폴더에 빈 파일을 생성하세요**

**힌트: New-Item -ItemType File 또는 echo "내용" > 파일명 사용**

### **문제 2-2: 파일 내용 확인**

- **hello.txt 파일의 내용을 출력하세요**
- **현재 폴더의 모든 파일과 폴더 목록을 자세히 확인하세요**

### **문제 2-3: 파일 복사cdls**

- **documents/hello.txt 파일을 backup 폴더에 복사하세요**
- **images 폴더의 모든 파일을 backup 폴더에 복사하세요**

---

## **🔄 Level 3: 파일 이동 및 이름 변경**

### **문제 3-1: 파일 이동**

- **temp 폴더에 test.txt 파일을 생성하세요**
- **이 파일을 documents 폴더로 이동하세요**

### **문제 3-2: 파일 이름 변경**

- **documents/test.txt 파일의 이름을 moved_file.txt로 변경하세요**
- **images/photo1.jpg 파일의 이름을 picture1.jpg로 변경하세요**

### **문제 3-3: 폴더 이름 변경**

- **temp 폴더의 이름을 temporary로 변경하세요**

---

## **🗑️ Level 4: 삭제 연습**

### **문제 4-1: 개별 파일 삭제**

- **documents/moved_file.txt 파일을 삭제하세요**
- **images/photo2.png 파일을 삭제하세요**

### **문제 4-2: 폴더 삭제**

- **temporary 폴더를 삭제하세요 (비어있는 폴더)**
- **backup 폴더와 그 안의 모든 내용을 삭제하세요**

---

## **🚀 Level 5: 종합 응용**

### **문제 5-1: 프로젝트 구조 만들기**

**다음과 같은 프로젝트 구조를 생성하세요:**

**my_project/**

**├── src/**

**│   └── main.py (내용: "print('Hello World')")**

**├── docs/**

**│   └── readme.txt (내용: "This is my project")**

**├── tests/**

**└── build/**

### **문제 5-2: 파일 정리**

- **src/main.py 파일을 build 폴더에 복사하세요**
- **docs/readme.txt 파일을 project_info.txt로 이름을 변경하세요**
- **tests 폴더를 삭제하세요**

### **문제 5-3: 최종 확인**

- **my_project 폴더의 모든 하위 내용을 재귀적으로 확인하세요**
- **각 폴더로 이동하여 파일 내용을 확인하세요**

---