# **리눅스 상대 주소 실습 문제**

## **사전 준비: 실습 환경 설정**

다음 명령어로 실습 환경을 준비하세요:

1. 1mkdir -p ~/practice/project/{src,docs,tests,config}
2. mkdir -p ~/practice/project/src/{main,utils}
3. mkdir -p ~/practice/project/docs/{user,dev}
4. mkdir -p ~/practice/project/tests/unit
5. touch ~/practice/project/src/main/app.py
6. touch ~/practice/project/docs/dev/api.md
7. touch ~/practice/project/tests/test_main.py

완성된 디렉토리 구조:

```
├── practice
│   └── project
│       ├── config
│       │   └── settings.conf
│       ├── docs
│       │   ├── dev
│       │   │   └── api.md
│       │   └── user
│       │       └── manual.txt
│       ├── README.md
│       ├── src
│       │   ├── main
│       │   │   └── app.py
│       │   └── utils
│       │       └── helper.py
│       └── tests
│           ├── test_main.py
│           └── unit

```

---

## **연습문제 1: 기본 상대 주소 이해**

1-1. 현재 위치에서 상대 주소 작성

현재 위치가 ~/practice/project/src/main/일 때, 다음 파일들로 이동하는 상대 주소를 작성하시오:

1. helper.py 파일 생성
2. README.md 파일 생성
3. manual.txt 파일 생성
4. settings.conf 파일 생성

**1-2. 상대 주소 검증**

위에서 작성한 상대 주소가 정확한지 다음 명령어로 확인하시오:

1. cd ~/practice/project/src/main/

---

## **연습문제 2: 다양한 시작점에서의 상대 주소**

**2-1. 시작점 변경 실습**

현재 위치가 ~/practice/project/docs/user/일 때:

1. app.py 파일로 이동하는 상대 주소를 작성하시오.

```
[hwang@localhost unit]$ cd ./../../docs/user
[hwang@localhost user]$ cd ./../../src/main
[hwang@localhost main]$ ls
app.py
```

1. test_main.py 파일을 상대 주소를 작성하시오.

```
[hwang@localhost user]$ cd ./../../tests/tesst_main.py
```

1. src/utils/ 디렉토리로 이동하는 상대 주소를 작성하시오.

```
[hwang@localhost user]$ cd ./../../src/utils
```

**2-2. 역방향 상대 주소**

현재 위치가 ~/practice/project/tests/unit/일 때:

1. 프로젝트 루트(~/practice/project/)로 이동하는 상대 주소를 작성하시오.
    
    ```
    hwang@localhost unit]$ cd ./../../
    [hwang@localhost project]$ 
    ```
    
2. api.md 파일로 이동하는 상대 주소를 작성하시오.
    
    ```
    [hwang@localhost unit]$ cd ./../../docs/dev/
    [hwang@localhost dev]$ ls
    api.md
    ```
    
3. helper.py 파일을 상대 주소를 작성하시오.
    
    ```
    [hwang@localhost unit]$ cd ./../../src/utils/
    [hwang@localhost utils]$ ls
    helper.py
    ```
    

---

## **연습문제 3: 파일 내용 확인 및 조작**

**3-1. 상대 주소를 이용한 파일 내용 출력**

현재 위치가 ~/practice/project/src/utils/일 때:

1. 프로젝트 루트의 README.md 파일 내용을 출력하시오.
    
    ```
    [hwang@localhost utils]$ cd ./../../
    [hwang@localhost project]$ cat README.md
    ```
    
2. docs/user/manual.txt 파일 정보 자세히 출력하시오.
    
    ```
    [hwang@localhost utils]$ cd ./../../docs/user/
    [hwang@localhost user]$ cat manual.txt
    ```
    
3. config/settings.conf 파일 정보 자세히 출력하시오.
    
    ```
    [hwang@localhost utils]$ cd ./../../config/
    [hwang@localhost config]$ cat setting.conf
    ```
    

**3-2. 상대 주소를 이용한 파일 생성**

현재 위치가 ~/practice/project/src/main/일 때:

1. 현재 디렉토리에 config.py 파일을 생성하고 "# Configuration module"이라는 내용을 작성하시오.
    
    ```
    [hwang@localhost main]$ echo "# Configuration module" > config.py
    ```
    
2. tests/ 디렉토리에 test_app.py 파일을 생성하고 "# App test file"이라는 내용을 작성하시오.
    
    ```
    [hwang@localhost main]$ cd ./../../tests/
    [hwang@localhost tests]$ echo "# App test file" > test_app.py
    [hwang@localhost tests]$ ls
    test_app.py  test_main.py  unit
    ```
    

---

## **연습문제 4: 파일 복사 및 이동**

**4-1. 상대 주소를 이용한 파일 복사**

현재 위치가 ~/practice/project/docs/dev/일 때:

1. api.md 파일을 docs/user/ 디렉토리에 api_copy.md로 복사하시오.
    
    ```
    [hwang@localhost dev]$ cp api.md ./../user/api_copy.md
    ```
    
2. src/utils/helper.py 파일을 현재 디렉토리에 복사하시오.
    
    ```
    [hwang@localhost dev]$ cp ./../../src/utils/helper.py  .
    [hwang@localhost dev]$ ls
    api.md  helper.py
    ```
    
3. config/settings.conf 파일을 tests/unit/ 디렉토리에 복사하시오.
    
    ```
    [hwang@localhost dev]$ cp ./../../config/settings.conf ./../../tests/unit/
    ```
    

**4-2. 상대 주소를 이용한 파일 이동**

현재 위치가 ~/practice/project/tests/일 때:

1. test_main.py 파일을 tests/unit/ 디렉토리로 이동하시오.
    
    ```
    [hwang@localhost tests]$ mv test_main.py unit/
    ```
    
2. src/main/config.py 파일을 config/ 디렉토리로 이동하시오.
    
    ```
    [hwang@localhost tests]$ mv ./../src/main/config.py ./../config/
    ```
    

---

## **연습문제 5: 복합 상대 주소 활용**

**5-1. 다중 파일 조작**

현재 위치가 ~/practice/project/일 때:

1. src/main/ 디렉토리의 모든 파일을 docs/dev/ 디렉토리에 복사하시오.
    
    ```
    [hwang@localhost project]$ cp -r src/main/ docs/dev/
    [hwang@localhost project]$ cd docs/dev/
    [hwang@localhost dev]$ ls
    api.md  helper.py  main
    ```
    
2. docs/user/ 디렉토리의 모든 파일을 tests/unit/ 디렉토리로 이동하시오.
    
    ```
    [hwang@localhost project]$ mv docs/user/ tests/unit/
    ```
    
3. config/ 디렉토리 전체를 backup_config/로 복사하시오.
    
    ```
    [hwang@localhost project]$ cp -r config/ backup_config/
    [hwang@localhost project]$ tree
    .
    ├── backup_config
    │   ├── config.py
    │   └── settings.conf
    ├── config
    │   ├── config.py
    │   └── settings.conf
    ├── docs
    │   └── dev
    │       ├── api.md
    │       ├── helper.py
    │       └── main
    │           └── app.py
    ├── README.md
    ├── src
    │   ├── main
    │   │   └── app.py
    │   └── utils
    │       └── helper.py
    └── tests
        ├── test_app.py
        └── unit
            ├── settings.conf
            ├── test_main.py
            └── user
                ├── api_copy.md
                └── manual.txt
    
    ```
    

---

## **연습문제 6: 에러 찾기 및 수정**

**6-1. 잘못된 상대 주소 찾기**

현재 위치가 ~/practice/project/docs/user/일 때, 다음 명령어들 중 에러가 있는 것을 찾고 올바른 명령어로 수정하시오:

```
1. # A
2. ls ../../../project/src/main/
3. 
4. # B
5. cat ../../src/utils/helper.py
6. 
7. # C
8. cd ../dev/../../config/
9.  cd ../../dev/../../config/
10. # D
11. cp manual.txt ../../tests/unit/backup.txt
12. 
13. # E
14. mv api_copy.md ../../../src/main/

```

**6-2. 경로 최적화**

다음 상대 주소를 더 간단하게 최적화하시오:

현재 위치: ~/practice/project/tests/unit/

1. ../../src/main/../utils/helper.py
    
    ```
    ../../src/utils/helper.py
    ```
    
2. ../../docs/user/../dev/api.md
    
    ```
    ../../docs//dev/api.md
    ```
    
3. ../../config/../README.md
    
    ```
    ../../README.md
    ```
    

---

## **연습문제 7: 종합 실습**

**7-1. 프로젝트 구조 재정리**

현재 위치가 ~/practice/project/일 때, 다음 작업을 수행하시오:

1. src/main/ 디렉토리에 models/ 하위 디렉토리를 생성하시오.
    
    ```
    [hwang@localhost project]$ mkdir ./src/main/models/
    [hwang@localhost project]$ cd ./src/main/models/
    [hwang@localhost models]$ 
    ```
    
2. docs/ 디렉토리에 README.md 파일을 생성하고 "# Project Documentation"이라는 내용을 작성하시오.
    
    ```
    [hwang@localhost project]$ echo "# Project Documentation" > docs/README.md
    [hwang@localhost project]$ cat docs/README.md
    # Project Documentation
    ```
    
3. tests/unit/ 디렉토리의 모든 파일을 tests/ 디렉토리로 이동하시오.
    
    ```
    [hwang@localhost project]$ mv tests/unit/*  tests/
    [hwang@localhost project]$ ls ./tests/
    settings.conf  test_app.py  test_main.py  unit  user
    ```
    
4. config/ 디렉토리의 모든 파일을 src/ 디렉토리에 복사하시오.
    
    ```
    [hwang@localhost project]$ cp -r config/ src/
    ```
    

**7-2. 백업 및 정리**

```
[hwang@localhost practice]$ tree
.
└── project
    ├── backup_config
    │   ├── config.py
    │   └── settings.conf
    ├── config
    │   ├── config.py
    │   └── settings.conf
    ├── docs
    │   ├── dev
    │   │   ├── api.md
    │   │   ├── helper.py
    │   │   └── main
    │   │       └── app.py
    │   └── README.md
    ├── README.md
    ├── src
    │   ├── config
    │   │   ├── config.py
    │   │   └── settings.conf
    │   ├── main
    │   │   ├── app.py
    │   │   └── models
    │   └── utils
    │       └── helper.py
    └── tests
        ├── settings.conf
        ├── test_app.py
        ├── test_main.py
        ├── unit
        └── user
            ├── api_copy.md
            └── manual.txt

```

현재 위치가 ~/practice/project/src/main/일 때:

1. 전체 프로젝트를 ../../project_backup/으로 복사하시오.
    
    ```
    [hwang@localhost main]$ cp -r ../../../* ../../../project_backup/
    cp: cannot copy a directory, '../../../project_backup', into itself, '../../../project_backup/project_backup'
    [hwang@localhost main]$ cp ../../../* ../../../project_backup/
    cp: -r not specified; omitting directory '../../../project'
    cp: -r not specified; omitting directory '../../../project_backup'
    [hwang@localhost main]$ cd ../../..
    [hwang@localhost practice]$ tree
    .
    ├── project
    │   ├── backup_config
    │   │   ├── config.py
    │   │   └── settings.conf
    │   ├── config
    │   │   ├── config.py
    │   │   └── settings.conf
    │   ├── docs
    │   │   ├── dev
    │   │   │   ├── api.md
    │   │   │   ├── helper.py
    │   │   │   └── main
    │   │   │       └── app.py
    │   │   └── README.md
    │   ├── README.md
    │   ├── src
    │   │   ├── config
    │   │   │   ├── config.py
    │   │   │   └── settings.conf
    │   │   ├── main
    │   │   │   ├── app.py
    │   │   │   └── models
    │   │   └── utils
    │   │       └── helper.py
    │   └── tests
    │       ├── settings.conf
    │       ├── test_app.py
    │       ├── test_main.py
    │       ├── unit
    │       └── user
    │           ├── api_copy.md
    │           └── manual.txt
    └── project_backup
        ├── project
        │   ├── backup_config
        │   │   ├── config.py
        │   │   └── settings.conf
        │   ├── config
        │   │   ├── config.py
        │   │   └── settings.conf
        │   ├── docs
        │   │   ├── dev
        │   │   │   ├── api.md
        │   │   │   ├── helper.py
        │   │   │   └── main
        │   │   │       └── app.py
        │   │   └── README.md
        │   ├── README.md
        │   ├── src
        │   │   ├── config
        │   │   │   ├── config.py
        │   │   │   └── settings.conf
        │   │   ├── main
        │   │   │   ├── app.py
        │   │   │   └── models
        │   │   └── utils
        │   │       └── helper.py
        │   └── tests
        │       ├── settings.conf
        │       ├── test_app.py
        │       ├── test_main.py
        │       ├── unit
        │       └── user
        │           ├── api_copy.md
        │           └── manual.txt
     
    ```
    
2. utils/ 디렉토리의 모든 .py 파일을 현재 디렉토리의 models/ 디렉토리로 복사하시오.
    
    ```
    [hwang@localhost main]$ mkdir models
    [hwang@localhost main]$ cp  ../utils/*.py ./models/
    [hwang@localhost main]$ ls models/
    helper.py
    ```
    
3. 프로젝트 루트의 README.md 파일을 현재 디렉토리에 PROJECT_INFO.md로 복사하시오.
    
    ```
    [hwang@localhost main]$ cp ../../README.md ./
    [hwang@localhost main]$ mv README.md PROJECT_INFO.md
    [hwang@localhost main]$ ls
    app.py  models  PROJECT_INFO.md
    ```
    

---