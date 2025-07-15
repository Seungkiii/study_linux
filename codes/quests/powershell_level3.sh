PS C:\Develops\quests\practice\temp> "" > test.txt
PS C:\Develops\quests\practice\temp> mv test.txt  C:\Develops\quests\practice\documents
PS C:\Develops\quests\practice\temp> cd ..
PS C:\Develops\quests\practice> cd documents
PS C:\Develops\quests\practice\documents> ls


    디렉터리: C:\Develops\quests\practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
-a----      2025-07-15   오후 3:52              6 test.txt


PS C:\Develops\quests\practice\documents> mv test.txt moved_file.txt
PS C:\Develops\quests\practice\documents> ls


    디렉터리: C:\Develops\quests\practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
-a----      2025-07-15   오후 3:52              6 moved_file.txt


PS C:\Develops\quests\practice\documents> cd C:\Develops\quests\practice\images
PS C:\Develops\quests\practice\images> mv photo1.jpg picture1.jpg
PS C:\Develops\quests\practice\images> ls


    디렉터리: C:\Develops\quests\practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              6 photo2.png
-a----      2025-07-15   오후 3:43              6 picture1.jpg


PS C:\Develops\quests\practice\images> cd ..
PS C:\Develops\quests\practice> mv temp temporary
PS C:\Develops\quests\practice> ls


    디렉터리: C:\Develops\quests\practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:50                backup
d-----      2025-07-15   오후 3:53                documents
d-----      2025-07-15   오후 3:54                images
d-----      2025-07-15   오후 3:52                temporary