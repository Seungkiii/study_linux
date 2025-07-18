<aside>
💡

인터뷰에서 단어 개념을 설명할 때 단어를 포함해서 설명하지 마라

ex) 아름다움을 설명하는데 아름다움을 더 뭐라뭐라 하는 설명

</aside>

https://github.com/yojulab/learn_computer_systems/wiki/10_02_linux_Directory

- 잠시 데이터를 가지고 있는거= 잠시 기억하는거 → 메모리
- 영구적으로 데이터를 가지고 있는거 = 계속 기억하는거 → 디스크

- 리눅스 파일시스템에서 기본적으로 특정 공간에 정보를 모아놔서 ls하면 안에 있는 파일 정보들이 한번에 다 나온다.(캡슐화된 파일들이 연결되어있다.)
- 핵심 요약
    
    ## 리눅스 파일시스템과 디렉토리 구조
    
    - **디렉토리는 파일과 서브디렉토리에 대한 정보(메타데이터)를 저장하는 특수한 파일**입니다.
    - 이 메타데이터에는 각 항목의 이름과 해당 파일 또는 디렉토리의 **inode** 번호가 포함되어 있습니다.
    - **inode**는 파일의 실제 데이터가 저장된 위치, 크기, 권한, 생성/수정 시간 등 파일의 속성 정보를 저장하는 별도의 데이터 구조입니다.
    
    ## 파일 정보 조회와 ls 명령어
    
    - `ls` 명령어를 실행하면, 현재 디렉토리의 **디렉토리 파일 안에 저장된 항목 목록(이름과 inode 번호)**을 불러옵니다.
    - 이후 각 파일의 inode를 참조해 파일의 상세 정보를 얻어 출력합니다.
    - 디렉토리에 포함된 모든 파일 정보가 실제로는 디스크의 다양한 위치에 흩어져 있지만, inode 참조로 연결되어 있어 논리적으로 한 공간에서 관리됩니다.
    
    ## 캡슐화 및 연결 구조
    
    - 디렉토리와 inode 구조 덕분에 파일 시스템의 데이터와 메타데이터가 분리되어 관리되며,
    - 디렉토리는 일종의 **목록(링크드 리스트 또는 해시 구조로 구현 가능)** 역할을 하고,
    - 각 파일은 inode를 통해 실제 데이터 블록과 연결됩니다.
    
    ## 요약
    
    - 리눅스 파일 시스템에서 디렉토리는 **파일 이름과 inode 번호 목록을 담은 특별한 파일**입니다.
    - `ls` 명령어는 이 디렉토리 파일을 읽어, 이름과 inode를 조회하고 상세 정보를 보여줍니다.
    - 파일과 디렉토리의 정보는 inode를 통해 물리적 저장 공간과 **논리적으로 연결(참조)**되어 있습니다.
    
- 자료와 정보의 차이 여부 : 가공되었냐
    - 자료 → 가공되고 나에게 유용하냐(이건 상대적) → 정보

---

## 와일드카드

| **와일드카드** | **의미** | **예시** |
| --- | --- | --- |
| `*` | 0개 이상의 모든 문자 | `*.txt` |
| `?` | 정확히 1개의 문자 | `file?.txt` |
| `[]` | 대괄호 안의 문자 중 하나 | `[abc].txt` |
| `{}` | 중괄호 안의 패턴 중 하나 | `{file1,file2}.txt` |

<aside>
💡

리눅스에서 와일드카드란 파일명이나 디렉토리명을 한번에 패턴 형식으로 지정할수 있는 특수기호입니다. 

예를 들어 모든 txt파일을  ls *.txt라는 명령어 한줄로  찾을 수 있습니다. 그래서 와일드 카드를 사용하면 반복적인 작업을 간소화하여 작업 효율성을 증대시킬 수 있습니다.

</aside>

- 이스케이프 문자 → 특수기호?
- &&로 연결되는 명령어 → 다중 명령어
- reculsive 옵션
- -r, —reculsive, 하이픈 두개는 풀네임

# Linux 와일드카드 실습 문제

## 기본 와일드카드 문자

- : 0개 이상의 모든 문자
- `?` : 정확히 1개의 문자
- `[]` : 대괄호 안의 문자 중 하나
- `{}` : 중괄호 안의 패턴 중 하나 (brace expansion)

## 실습 환경 설정

먼저 다음 명령어를 실행하여 실습 환경을 만들어보세요:

```bash
mkdir wildcard_practice
cd wildcard_practice
touch file1.txt file2.txt file3.doc report.txt data.csv
touch test1.log test2.log error.log debug.log
touch image1.jpg image2.png photo.gif
touch backup_2024.tar backup_2023.tar config.conf
mkdir logs temp docs

```

```
[hwang@localhost wildcard_practice]$ tree
.
├── backup_2023.tar
├── backup_2024.tar
├── config.conf
├── data.csv
├── debug.log
├── docs
│   ├── image1.jpg
│   ├── image2.png
│   ├── photo.gif
│   └── readme.txt
├── error.log
├── file1.txt
├── file2.txt
├── file3.doc
├── index.txt
├── logs
│   ├── readme.txt
│   └── readme.txt,
├── report.txt
├── temp
│   ├── backup_2023.tar
│   ├── backup_2024.tar
│   ├── config.conf
│   ├── data.csv
│   ├── debug.log
│   ├── error.log
│   ├── file1.txt
│   ├── file2.txt
│   ├── file3.doc
│   ├── readme.txt
│   ├── report.txt
│   ├── test1.log
│   └── test2.log
├── test1.log
└── test2.log

```

## 문제 1: 기본 와일드카드 (*) 사용

### 1-1. 모든 `.txt` 파일 목록 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l *.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 report.txt
```

### 1-2. `file`로 시작하는 모든 파일 목록 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l file*
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file3.doc
```

### 1-3. `.log`로 끝나는 모든 파일 목록 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l *log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 debug.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 error.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test2.log
```

### 1-4. `backup`으로 시작하는 모든 파일을 `temp` 디렉터리로 복사

```bash
[hwang@localhost wildcard_practice]$ cp backup* temp
[hwang@localhost wildcard_practice]$ ls -l temp
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:40 backup_2023.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:40 backup_2024.tar
```

---

## 문제 2: 단일 문자 와일드카드 (?) 사용

### 2-1. `file`로 시작하고 한 글자 숫자가 오는 `.txt` 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l file?.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
```

### 2-2. `test`로 시작하고 한 글자 숫자가 오는 `.log` 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l test?.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test2.log
```

### 2-3. `image`로 시작하고 한 글자 숫자가 오는 모든 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l image?*
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image1.jpg
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image2.png
```

---

## 문제 3: 문자 범위 ([]) 사용

### 3-1. `file1.txt`, `file2.txt`, `file3.doc` 중에서 `file1.txt`와 `file2.txt`만 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l file[0-9].txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
```

### 3-2. `test1.log`와 `test2.log`만 출력 (error.log, debug.log 제외)

```bash
[hwang@localhost wildcard_practice]$ ls -l test[12].log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test2.log
```

### 3-3. 파일명이 `a`부터 `f`로 시작하는 모든 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l [a-f]*
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2023.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2024.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 config.conf
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 data.csv
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 debug.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 error.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file3.doc

docs:
total 0
```

---

## 문제 4: 복합 와일드카드 활용

### 4-1. 확장자가 3글자인 모든 파일 출력 (예: .txt, .doc, .log, .jpg, .png, .gif, .tar)

```bash
[hwang@localhost wildcard_practice]$ ls -l *.???
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2023.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2024.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 data.csv
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 debug.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 error.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file3.doc
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image1.jpg
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image2.png
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 photo.gif
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 report.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test2.log
```

### 4-2. 숫자가 포함된 모든 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l *[0-9]*
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2023.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2024.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file3.doc
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image1.jpg
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image2.png
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test2.log
```

### 4-3. `.txt` 또는 `.log` 파일만 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l *.{txt,log}
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 debug.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 error.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 report.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 test2.logㅣㄴ[!ㅅ
```

---

## 문제 5: 고급 와일드카드 활용

### 5-1. 파일명이 `test`로 시작하지 않는 모든 `.log` 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l !(test*).log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 debug.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 error.log
```

### 5-2. 모든 이미지 파일 (jpg, png, gif)을 `docs` 디렉터리로 이동

```bash
[hwang@localhost wildcard_practice]$ mv *.{jpg,png,gif} docs
[hwang@localhost wildcard_practice]$ ls -l docs
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image1.jpg
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image2.png
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 photo.gif
```

### 5-3. 2023년 또는 2024년 백업 파일만 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l *{2023,2024}*
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2023.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 backup_2024.tar
```

---

## 문제 6: 실전 응용

### 6-1. 확장자가 있는 모든 파일을 `temp` 디렉터리로 복사

```bash
[hwang@localhost wildcard_practice]$ cp -r *.* temp
[hwang@localhost wildcard_practice]$ ls -l temp
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 backup_2023.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 backup_2024.tar
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 config.conf
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 data.csv
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 debug.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 error.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 file1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 file2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 file3.doc
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 report.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 test1.log
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:04 test2.log
```

### 6-2. 파일명이 4글자 이하인 파일들의 상세 정보 출력

```bash
[hwang@localhost wildcard_practice]$ ls -la ????
docs:
total 4
drwxr-xr-x. 2 hwang hwang   59 Jul 17 15:01 .
drwxr-xr-x. 5 hwang hwang 4096 Jul 17 15:01 ..
-rw-r--r--. 1 hwang hwang    0 Jul 17 14:38 image1.jpg
-rw-r--r--. 1 hwang hwang    0 Jul 17 14:38 image2.png
-rw-r--r--. 1 hwang hwang    0 Jul 17 14:38 photo.gif

logs:
total 4
drwxr-xr-x. 2 hwang hwang    6 Jul 17 14:38 .
drwxr-xr-x. 5 hwang hwang 4096 Jul 17 15:01 ..

temp:
total 8
drwxr-xr-x. 2 hwang hwang 4096 Jul 17 15:04 .
drwxr-xr-x. 5 hwang hwang 4096 Jul 17 15:01 ..
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 backup_2023.tar
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 backup_2024.tar
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 config.conf
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 data.csv
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 debug.log
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 error.log
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 file1.txt
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 file2.txt
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 file3.doc
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 report.txt
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 test1.log
-rw-r--r--. 1 hwang hwang    0 Jul 17 15:04 test2.log

```

---

## 문제 7: 디렉터리 와일드카드

### 7-1. 현재 디렉터리의 모든 하위 디렉터리 목록 출력

```bash
[hwang@localhost wildcard_practice]$ ls */
docs/:
image1.jpg  image2.png  photo.gif  readme.txt

logs/:
readme.txt  readme.txt,

temp/:
backup_2023.tar  data.csv   file1.txt  readme.txt  test2.log
backup_2024.tar  debug.log  file2.txt  report.txt
config.conf      error.log  file3.doc  test1.log

```

### 7-2. `d`로 시작하는 디렉터리만 출력

```bash
[hwang@localhost wildcard_practice]$ ls -l d*/
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image1.jpg
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 image2.png
-rw-r--r--. 1 hwang hwang 0 Jul 17 14:38 photo.gif
-rw-r--r--. 1 hwang hwang 0 Jul 17 15:33 readme.txt

```

### 7-3. 모든 하위 디렉터리에 `readme.txt` 파일 생성

```bash
[hwang@localhost wildcard_practice]$ touch {docs/readme.txt,logs/readme.txt,temp/readme.txt}
```

---

## 문제 8: 복잡한 패턴 매칭

### 8-1. 파일명에 숫자가 정확히 1개 들어간 파일 출력

```bash
[hwang@localhost wildcard_practice]$ ls ????[0-9][!0-9]*
file1.txt  file2.txt  file3.doc  test1.log  test2.log

ls | grep -E '^[^0-9]*[0-9][^0-9]*$'
```

- 정규표현식 해설
    
    ## **전체 정규표현식**
    
    ```
    ^[^0-9]*[0-9][^0-9]*$
    ```
    
    ## **1. `^`**
    
    - **문자열의 시작**을 의미합니다.
    - 예: **`^hello`** → "hello"로 시작하는 문자열과 매칭
    
    ## **2. `[^0-9]*`**
    
    - **`[...]`**는 **문자 클래스**라고 불리며, 괄호 안에 적힌 문자 중 하나를 뜻합니다.
    - **`^`**가 문자 클래스 안에 있을 때는 **부정(not)** 의미
        - **`[0-9]`**는 "숫자 0부터 9까지 중 한 글자"
        - **`[^0-9]`**는 "숫자가 아닌 문자 중 한 글자"
    - 는 바로 앞 문자가 **0번 이상 반복**됨을 의미
    - 따라서 **`[^0-9]*`**는
        - "숫자가 아닌 문자가 0번 이상 연속"
        - 다시 말해, 숫자가 하나도 없는 글자(문자, 특수문자 등)들이 연속해 올 수 있음
    
    ## **3. `[0-9]`**
    
    - 숫자 한 글자를 의미합니다 (0부터 9 중 하나)
    - 즉, **정규표현식 내에서 딱 한 자리 숫자가 반드시 있어야 한다**는 뜻
    
    ## **4. `[^0-9]*` (다시 한 번)**
    
    - 2번과 동일하게 숫자가 아닌 문자들이 0번 이상 반복
    
    ## **5. `$`**
    
    - **문자열의 끝**을 의미합니다.
    
    ## **정리하면**
    
    - **`^`** + **`[^0-9]*`** → 문자열이 숫자 외의 문자(0개 이상)로 시작해야 함
    - 그 다음 **`[0-9]`** → 딱 한 자리 숫자가 나타남
    - 그 뒤 **`[^0-9]*`** → 숫자가 아닌 문자(0개 이상)로 끝나야 함
    - **`$`** → 문자열 끝
    
    즉, **문자열 전체에 숫자가 정확히 1개 포함되어 있다**는 뜻입니다.
    

### 8-2. 확장자가 `.txt`, `.doc`, `.log` 중 하나인 파일들의 크기 확인

```bash
[hwang@localhost wildcard_practice]$ ls -s *.{txt,doc,log}
0 debug.log  0 file1.txt  0 file3.doc  0 report.txt  0 test2.log
0 error.log  0 file2.txt  0 index.txt  0 test1.log
```

### 8-3. 파일명이 `test` 또는 `file`로 시작하는 모든 파일 삭제 (주의: 실제로는 실행하지 말고 명령어만 작성)

```bash
[hwang@localhost wildcard_practice]$ rm {test, file}*.*
```

---

---

# Linux 파일 관리 명령어 와일드카드 실습 문제

## 실습 환경 설정

**먼저 다음 명령어들을 실행하여 실습 환경을 구성하세요:**

# 실습 디렉터리 생성

mkdir wildcard_file_practice

cd wildcard_file_practice

# 테스트 파일들 생성

touch report1.txt report2.txt report3.txt

touch data1.csv data2.csv data3.csv data_old.csv

touch image1.jpg image2.jpg image3.png photo.gif

touch backup_2023.tar backup_2024.tar config.conf

touch log_error.txt log_access.txt log_system.txt

touch temp1.tmp temp2.tmp temp3.tmp

touch file_001.dat file_002.dat file_010.dat

touch script1.sh script2.sh test_script.sh

touch document.pdf presentation.ppt spreadsheet.xls

touch readme.md changelog.md license.txt

touch old_report.txt new_report.txt final_report.txt

# 기본 디렉터리들 생성

mkdir archives backup logs images documents scripts

```
mkdir wildcard_file_practice && \
cd wildcard_file_practice && \
touch report{1,2,3}.txt data{1,2,3}.csv data_old.csv image{1,2,3}.png photo.gif  backup_{2023,2024}.tar config.conf log_{error,access,system}.txt temp{1,2,3}.tmp file_{001,002,010}.dat script{1,2}.sh test_srcipt.sh document.pdf presentation.ppt spreadsheet.xls {readme,changelog}.log {license,old_report,new_report,final_report}.txt && \
mkdir archives backup logs images documents scripts
```

---

## 1. mkdir 명령어 와일드카드 실습

### 1-1. 연도별 백업 디렉터리 생성

# 2020년부터 2024년까지 백업 디렉터리를 한 번에 생성하세요

# 예: backup_2020, backup_2021, backup_2022, backup_2023, backup_2024

# 명령어를 작성하세요:

```
[hwang@localhost wildcard_file_practice]$ mkdir backup_{2020,2021,2022,2023,2024}

```

### 1-2. 월별 로그 디렉터리 생성

# logs 디렉터리 안에 01월부터 12월까지 디렉터리 생성

# 예: logs/log_01, logs/log_02, ..., logs/log_12

# 명령어를 작성하세요:

```
hwang@localhost wildcard_file_practice]$ mkdir -p logs/log_{1..12}
[hwang@localhost wildcard_file_practice]$ ls logs/*
logs/log_1:

logs/log_10:

logs/log_11:

logs/log_12:

logs/log_2:

logs/log_3:

logs/log_4:

logs/log_5:

logs/log_6:

logs/log_7:

logs/log_8:

logs/log_9:

```

### 1-3. 프로젝트별 디렉터리 생성

# project_A, project_B, project_C 디렉터리를 한 번에 생성하세요

# 명령어를 작성하세요:

```
[hwang@localhost wildcard_file_practice]$ mkdir projet_{A,B,C}
```

### 1-4. 계층적 디렉터리 생성

# data/2024/{01,02,03} 구조로 디렉터리를 생성하세요

# (data 디렉터리 안에 2024 디렉터리, 그 안에 01, 02, 03 디렉터리)

# 명령어를 작성하세요:

```
[hwang@localhost wildcard_file_practice]$ mkdir -p data/2024/{01,02,03}
```

---

## 2. cp 명령어 와일드카드 실습

### 2-1. 확장자별 파일 복사

# 모든 .txt 파일을 backup 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ cp *.txt backup
[hwang@localhost wildcard_file_practice]$ ls -l backup
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 final_report.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 license.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 log_access.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 log_error.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 log_system.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 new_report.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 old_report.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 report1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 report2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:52 report3.txt

```

### 2-2. 특정 패턴 파일 복사

# "report"로 시작하는 모든 파일을 documents 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ cp report*.* documents
[hwang@localhost wildcard_file_practice]$ ls -l documents
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:54 report1.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:54 report2.txt
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:54 report3.txt
```

### 2-3. 숫자가 포함된 파일 복사

# 파일명에 숫자가 포함된 모든 이미지 파일(.jpg, .png)을 images 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ cp *[0-9]*.{jpg,png} images/
```

### 2-4. 특정 범위의 파일 복사

# data1.csv, data2.csv, data3.csv 파일만 backup 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ cp data{1,2,3}.csv backup/
```

### 2-5. 복합 조건 파일 복사

# "log_"로 시작하는 .txt 파일들을 logs 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ cp log_*.txt logs/
```

---

## 3. mv 명령어 와일드카드 실습

```bash
hwang@localhost wildcard_file_practice]$ tree
.
├── archives
├── backup
│   ├── final_report.txt
│   ├── license.txt
│   ├── log_access.txt
│   ├── log_error.txt
│   ├── log_system.txt
│   ├── new_report.txt
│   ├── old_report.txt
│   ├── report1.txt
│   ├── report2.txt
│   └── report3.txt
├── backup_2020
├── backup_2021
├── backup_2022
├── backup_2023
├── backup_2023.tar
├── backup_2024
├── backup_2024.tar
├── changelog.log
├── config.conf
├── data
│   └── 2024
│       ├── 01
│       ├── 02
│       └── 03
├── data1.csv
├── data2.csv
├── data3.csv
├── data_old.csv
├── document.pdf
├── documents
│   ├── report1.txt
│   ├── report2.txt
│   └── report3.txt
├── file_001.dat
├── file_002.dat
├── file_010.dat
├── final_report.txt
├── image1.jpg
├── image2.jpg
├── image3.png
├── images
│   ├── image1.png
│   ├── image2.png
│   └── image3.png
├── license.txt
├── log_access.txt
├── log_error.txt
├── logs
│   ├── log_1
│   ├── log_10
│   ├── log_11
│   ├── log_12
│   ├── log_2
│   ├── log_3
│   ├── log_4
│   ├── log_5
│   ├── log_6
│   ├── log_7
│   ├── log_8
│   └── log_9
├── log_system.txt
├── new_report.txt
├── old_report.txt
├── photo.gif
├── presentation.ppt
├── projet_A
├── projet_B
├── projet_C
├── readme.log
├── report1.txt
├── report2.txt
├── report3.txt
├── script1.sh
├── script2.sh
├── scripts
├── spreadsheet.xls
├── temp1.tmp
├── temp2.tmp
├── temp3.tmp
└── test_srcipt.sh

```

### 3-1. 임시 파일 이동

# 모든 .tmp 파일을 temp 디렉터리로 이동하세요 (mkdir temp 먼저 실행)

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ mv *.tmp temp/
[hwang@localhost wildcard_file_practice]$ ls -l temp
total 0
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:43 temp1.tmp
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:43 temp2.tmp
-rw-r--r--. 1 hwang hwang 0 Jul 17 17:43 temp3.tmp

```

### 3-2. 백업 파일 정리

# "backup_"로 시작하는 모든 파일을 archives 디렉터리로 이동하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ mv backup_* archives/
[hwang@localhost wildcard_file_practice]$ ls archives/
backup_2020  backup_2021  backup_2022  backup_2023  backup_2023.tar  backup_2024  backup_2024.tar
```

### 3-3. 스크립트 파일 정리

# 모든 .sh 파일을 scripts 디렉터리로 이동하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ ls scripts/
script1.sh  script2.sh  test_srcipt.sh
```

### 3-4. 특정 패턴 파일 이동

# "file_"로 시작하고 3자리 숫자가 포함된 .dat 파일들을 data 디렉터리로 이동하세요

# (data 디렉터리가 없다면 먼저 생성)

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ mv file_[0-9][0-9][0-9].dat data/
[hwang@localhost wildcard_file_practice]$ ls data/
2024  file_001.dat  file_002.dat  file_010.dat
```

### 3-5. 조건부 파일 이동

# "old_" 또는 "new_"로 시작하는 모든 파일을 archives 디렉터리로 이동하세요

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ mv {"old_","new_"}* archives/
[hwang@localhost wildcard_file_practice]$ ls archives/
backup_2020  backup_2022  backup_2023.tar  backup_2024.tar  old_report.txt
backup_2021  backup_2023  backup_2024      new_report.txt
```

---

## 4. rm 명령어 와일드카드 실습

### 4-1. 임시 파일 삭제

# 모든 .tmp 파일을 삭제하세요 (주의: 실제로는 신중히 실행)

# 명령어를 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ find . -name "*.tmp" -type f -delete
```

### 4-2. 특정 패턴 파일 삭제

# "temp"로 시작하는 모든 파일을 삭제하세요

# 명령어를 작성하세요:

```bash
rm -r temp*
```

### 4-3. 백업 파일 정리

# 2023년 백업 파일만 삭제하세요 (backup_2023.tar)

# 명령어를 작성하세요:

```bash
find . -name "backup_2023.tar" -type f -delete
```

### 4-4. 조건부 파일 삭제

# 확장자가 3글자가 아닌 파일들을 삭제하세요

# 힌트: 확장자가 .jpg, .png, .gif, .txt, .csv, .tar, .dat, .pdf, .ppt, .xls가 아닌 파일

# 명령어를 작성하세요:

```bash
rm -r *.!(???)
```

---

## 5. 복합 명령어 실습

### 5-1. 파일 정리 시스템

# 1단계: 모든 이미지 파일(.jpg, .png, .gif)을 images 디렉터리로 이동

# 2단계: 모든 문서 파일(.pdf, .ppt, .xls, .md)을 documents 디렉터리로 이동

# 3단계: 모든 데이터 파일(.csv, .dat)을 data 디렉터리로 이동 (없으면 생성)

# 명령어들을 작성하세요:

```bash
 mv *.{jpg,png,gif} images/
 mv *.{pdf,ppt,xls,md} documents/
 mv *.{csv,dat} data/
```

### 5-2. 백업 및 정리 작업

# 1단계: 모든 .txt 파일을 backup/txt_files 디렉터리로 복사 (디렉터리 생성 필요)

# 2단계: 모든 설정 파일(.conf)을 backup/config 디렉터리로 복사

# 3단계: 원본 설정 파일들을 삭제

# 명령어들을 작성하세요:

```bash
cp *.txt backup/txt_files/
cp *.conf backup/txt_files/
rm backup/txt_files/*.conf
```

### 5-3. 날짜별 로그 정리

# 1단계: logs 디렉터리에 error, access, system 하위 디렉터리 생성

# 2단계: log_error.txt를 logs/error/로 이동

# 3단계: log_access.txt를 logs/access/로 이동

# 4단계: log_system.txt를 logs/system/로 이동

# 명령어들을 작성하세요:

```bash
[hwang@localhost wildcard_file_practice]$ ls logs
access  log_1   log_11  log_2  log_4  log_6  log_8  log_access.txt  log_system.txt
error   log_10  log_12  log_3  log_5  log_7  log_9  log_error.txt   system
[hwang@localhost wildcard_file_practice]$ mv logs/log_error.txt logs/error/
[hwang@localhost wildcard_file_practice]$ mv logs/log_access.txt logs/access/
[hwang@localhost wildcard_file_practice]$ mv logs/log_system.txt logs/system/

```

---

## 6. 고급 와일드카드 실습

### 6-1. 복잡한 패턴 매칭

# "report" 또는 "data"로 시작하고 숫자가 포함된 모든 파일을 찾아서 processed 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash

```

### 6-2. 제외 패턴 활용

# 모든 파일 중에서 "final_"로 시작하지 않는 .txt 파일들을 draft 디렉터리로 이동하세요

# 명령어를 작성하세요:

```bash

```

### 6-3. 범위 지정 패턴

# 파일명에 001부터 009까지의 숫자가 포함된 파일들을 single_digit 디렉터리로 복사하세요

# 명령어를 작성하세요:

```bash

```

---

## 7. 실전 시나리오 문제

### 7-1. 프로젝트 정리 시나리오

# 시나리오: 프로젝트 종료 후 파일 정리

# 1. 완료된 리포트 파일들(report*.txt)을 completed 디렉터리로 이동

# 2. 작업 중인 파일들(temp*, *_draft)을 ongoing 디렉터리로 이동

# 3. 백업 파일들(backup_*)을 archive 디렉터리로 이동

# 4. 불필요한 임시 파일들(*.tmp)을 삭제

# 명령어들을 작성하세요:

```bash

```

### 7-2. 로그 관리 시나리오

# 시나리오: 서버 로그 정리

# 1. 2024년 로그 파일들을 logs/2024 디렉터리로 이동

# 2. 에러 로그들을 logs/errors 디렉터리로 복사

# 3. 2023년 로그 파일들을 삭제

# 4. 시스템 로그들을 logs/system 디렉터리로 이동

# 명령어들을 작성하세요:

```bash

```

### 7-3. 개발 환경 정리 시나리오

# 시나리오: 개발 프로젝트 구조 정리

# 1. 모든 스크립트 파일(*.sh)을 scripts 디렉터리로 이동

# 2. 설정 파일들(*.conf, *.config)을 config 디렉터리로 복사

# 3. 문서 파일들(*.md, *.txt)을 docs 디렉터리로 이동

# 4. 데이터 파일들(*.csv, *.dat)을 data 디렉터리로 이동

# 명령어들을 작성하세요:

```bash

```

---

## 8. 보너스 문제

### 8-1. 한 줄 명령어 도전

# 모든 이미지 파일을 images 디렉터리로 이동하고,

# 모든 문서 파일을 docs 디렉터리로 이동하는 작업을

# 한 줄의 명령어로 실행하세요 (세미콜론 또는 && 사용)

# 명령어를 작성하세요:

```bash

```

### 8-2. 조건부 실행

# images 디렉터리가 존재하면 모든 .jpg 파일을 이동하고,

# 존재하지 않으면 디렉터리를 생성한 후 이동하는 명령어를 작성하세요

# 명령어를 작성하세요:

```bash

```

### 8-3. 파일 개수 확인 후 실행

# .txt 파일이 5개 이상 있으면 backup 디렉터리로 복사하고,

# 그렇지 않으면 "파일이 부족합니다" 메시지를 출력하세요

# 명령어를 작성하세요:

```bash

```

---

## 9. 검증 명령어

각 문제를 해결한 후 다음 명령어들로 결과를 확인하세요:

# 디렉터리 구조 확인

ls -la

# 특정 디렉터리 내용 확인

ls -la backup/

ls -la images/

ls -la documents/

# 파일 개수 확인

ls *.txt | wc -l

ls *.jpg | wc -l

# 전체 파일 목록 확인

find . -type f | sort

```bash

```

---

## 10. 주의사항

⚠️ **실습 시 주의사항:**

- rm 명령어 사용 시 특히 주의하세요
- 중요한 파일은 미리 백업하세요
- 와일드카드 패턴이 의도한 파일들만 선택하는지 먼저 ls 명령어로 확인하세요
- 실제 서버에서는 더욱 신중히 실행하세요

**패턴 확인 방법:**

# 실제 명령 실행 전에 패턴이 올바른지 확인

echo cp *.txt backup/    # 실제로는 실행되지 않고 명령어만 출력

ls *.txt                 # 선택될 파일들 미리 확인

---

## 힌트

- {} 중괄호 확장 활용: mkdir {dir1,dir2,dir3}
- [] 문자 범위 활용: [1-3], [a-z]
- 와일드카드 활용: file*, *.txt
- ? 단일 문자 활용: file?.txt
- 복합 패턴 활용: *[0-9]*, file[1-3].txt
- 디렉터리 생성 시 -p 옵션 활용: mkdir -p path/to/directory