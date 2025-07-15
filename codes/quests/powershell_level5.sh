PS C:\Develops\quests> mkdir my_project


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:15                my_project


PS C:\Develops\quests> mkdir src, tests,build


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:16                src
d-----      2025-07-15   오후 4:16                tests
d-----      2025-07-15   오후 4:16                build


PS C:\Develops\quests> mkdir docs


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:16                docs


PS C:\Develops\quests> ls


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:16                build
d-----      2025-07-15   오후 4:16                docs
d-----      2025-07-15   오후 4:15                my_project
d-----      2025-07-15   오후 4:14                practice
d-----      2025-07-15   오후 4:16                src
d-----      2025-07-15   오후 4:16                tests


PS C:\Develops\quests> rm build
PS C:\Develops\quests> rm docs
PS C:\Develops\quests> rm src
PS C:\Develops\quests> ls


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:15                my_project
d-----      2025-07-15   오후 4:14                practice
d-----      2025-07-15   오후 4:16                tests


PS C:\Develops\quests> cd my_project
PS C:\Develops\quests\my_project> mkdir src, docs, tests, build


    디렉터리: C:\Develops\quests\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:17                src
d-----      2025-07-15   오후 4:17                docs
d-----      2025-07-15   오후 4:17                tests
d-----      2025-07-15   오후 4:17                build


PS C:\Develops\quests\my_project> cd src
PS C:\Develops\quests\my_project\src> "print("Hello World")" > main.py
위치 줄:1 문자:9
+ "print("Hello World")" > main.py
+         ~~~~~
식 또는 문에서 예기치 않은 'Hello' 토큰입니다.
    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRe
   cordException
    + FullyQualifiedErrorId : UnexpectedToken

PS C:\Develops\quests\my_project\src> "print('Hello World')" > main.py
PS C:\Develops\quests\my_project\src> ls


    디렉터리: C:\Develops\quests\my_project\src


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:20             46 main.py


PS C:\Develops\quests\my_project\src> cd ..
PS C:\Develops\quests\my_project> cd docs
PS C:\Develops\quests\my_project\docs> "THis is my project" > readme.txt
PS C:\Develops\quests\my_project\docs> ls


    디렉터리: C:\Develops\quests\my_project\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:20             42 readme.txt


PS C:\Develops\quests\my_project\docs> cd ..
PS C:\Develops\quests\my_project> cd src
PS C:\Develops\quests\my_project\src> cp main.py C:\Develops\quests\my_project\build
PS C:\Develops\quests\my_project\src> cd C:\Develops\quests\my_project\build
PS C:\Develops\quests\my_project\build> ls


    디렉터리: C:\Develops\quests\my_project\build


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:20             46 main.py


PS C:\Develops\quests\my_project\build> cd C:\Develops\quests\my_project\docs
PS C:\Develops\quests\my_project\docs> mv readme.txt project_info.txt
PS C:\Develops\quests\my_project\docs> ls


    디렉터리: C:\Develops\quests\my_project\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:20             42 project_info.txt


PS C:\Develops\quests\my_project\docs> cd ..
PS C:\Develops\quests\my_project> rm tests
PS C:\Develops\quests\my_project> ls


    디렉터리: C:\Develops\quests\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:22                build
d-----      2025-07-15   오후 4:22                docs
d-----      2025-07-15   오후 4:20                src


PS C:\Develops\quests\my_project> ls


    디렉터리: C:\Develops\quests\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:22                build
d-----      2025-07-15   오후 4:22                docs
d-----      2025-07-15   오후 4:20                src


PS C:\Develops\quests\my_project> cd ..
PS C:\Develops\quests> ls


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:23                my_project
d-----      2025-07-15   오후 4:14                practice
d-----      2025-07-15   오후 4:16                tests


PS C:\Develops\quests> rm tests
PS C:\Develops\quests> ls


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:23                my_project
d-----      2025-07-15   오후 4:14                practice


PS C:\Develops\quests> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.
├─my_project
│  ├─build
│  ├─docs
│  └─src
└─practice
    ├─documents
    └─images
PS C:\Develops\quests> cd my_project
PS C:\Develops\quests\my_project> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.
├─build
├─docs
└─src
PS C:\Develops\quests\my_project> cd src
PS C:\Develops\quests\my_project\src> cat main.py
print('Hello World')
PS C:\Develops\quests\my_project\src> cd..
PS C:\Develops\quests\my_project> cd docs
PS C:\Develops\quests\my_project\docs> cat project_info.txt
THis is my project