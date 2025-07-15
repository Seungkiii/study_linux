PS C:\Develops\quests\practice\documents> "Hello PowerShell!"> hello.txt
PS C:\Develops\quests\practice\documents> cd C:\Develops\quests\practice\images
PS C:\Develops\quests\practice\images> echo "" > photo1.jpg
PS C:\Develops\quests\practice\images> echo "" > photo2.png
PS C:\Develops\quests\practice\images> ls


    디렉터리: C:\Develops\quests\practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              6 photo1.jpg
-a----      2025-07-15   오후 3:43              6 photo2.png


PS C:\Develops\quests\practice\images> cd C:\Develops\quests\practice\documents
PS C:\Develops\quests\practice\documents> cat hello.txt
Hello PowerShell!
PS C:\Develops\quests\practice\documents> cp hello.txt C:\Develops\quests\practice\
PS C:\Develops\quests\practice\documents> cd ..
PS C:\Develops\quests\practice> cd backup
PS C:\Develops\quests\practice\backup> ls
PS C:\Develops\quests\practice\backup> cd documents
cd : 'C:\Develops\quests\practice\backup\documents' 경로는 존재하지 않으
므로 찾을 수 없습니다.
위치 줄:1 문자:1
+ cd documents
+ ~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (C:\Develops\que...ackup\d
   ocuments:String) [Set-Location], ItemNotFoundException
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands
   .SetLocationCommand

PS C:\Develops\quests\practice\backup> cd ..
PS C:\Develops\quests\practice> cd documents
PS C:\Develops\quests\practice\documents> cp hello.txt C:\Develops\quests\practice\backup
PS C:\Develops\quests\practice\documents> cd ..
PS C:\Develops\quests\practice> cd backup
PS C:\Develops\quests\practice\backup> ls


    디렉터리: C:\Develops\quests\practice\backup


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt


PS C:\Develops\quests\practice\backup> cd ..
PS C:\Develops\quests\practice> cd images
PS C:\Develops\quests\practice\images> ls


    디렉터리: C:\Develops\quests\practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              6 photo1.jpg
-a----      2025-07-15   오후 3:43              6 photo2.png


PS C:\Develops\quests\practice\images> cp photo1.jpg photo2.png  C:\Develops\quests\practice\backup
Copy-Item : 'C:\Develops\quests\practice\backup' 인수를 허용하는 위치 매
개 변수를 찾을 수 없습니다.
위치 줄:1 문자:1
+ cp photo1.jpg photo2.png  C:\Develops\quests\practice\backup
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (:) [Copy-Item], Paramete
   rBindingException
    + FullyQualifiedErrorId : PositionalParameterNotFound,Microsoft.Powe
   rShell.Commands.CopyItemCommand

PS C:\Develops\quests\practice\images> cp photo1.jpg  C:\Develops\quests\practice\backup
PS C:\Develops\quests\practice\images> cp photo2.png  C:\Develops\quests\practice\backup
PS C:\Develops\quests\practice\images> cd  C:\Develops\quests\practice\backuo
cd : 'C:\Develops\quests\practice\backuo' 경로는 존재하지 않으므로 찾을
수 없습니다.
위치 줄:1 문자:1
+ cd  C:\Develops\quests\practice\backuo
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (C:\Develops\quests\practi
   ce\backuo:String) [Set-Location], ItemNotFoundException
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands
   .SetLocationCommand

PS C:\Develops\quests\practice\images> cd  C:\Develops\quests\practice\backup
PS C:\Develops\quests\practice\backup> ls


    디렉터리: C:\Develops\quests\practice\backup


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
-a----      2025-07-15   오후 3:43              6 photo1.jpg
-a----      2025-07-15   오후 3:43              6 photo2.png
