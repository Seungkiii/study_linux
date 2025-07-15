
PS C:\Develops\quests\practice\documents> ls


    디렉터리: C:\Develops\quests\practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
-a----      2025-07-15   오후 3:52              6 moved_file.txt


PS C:\Develops\quests\practice\documents> rm moved_file.txt
PS C:\Develops\quests\practice\documents> ls


    디렉터리: C:\Develops\quests\practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt


PS C:\Develops\quests\practice\documents> cd C:\Develops\quests\practice\images
PS C:\Develops\quests\practice\images> ls


    디렉터리: C:\Develops\quests\practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              6 photo2.png
-a----      2025-07-15   오후 3:43              6 picture1.jpg


PS C:\Develops\quests\practice\images> rm photo2.png
PS C:\Develops\quests\practice\images> ls


    디렉터리: C:\Develops\quests\practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              6 picture1.jpg


PS C:\Develops\quests\practice\images> cd .
PS C:\Develops\quests\practice\images> cd ..
PS C:\Develops\quests\practice> rm temporary
PS C:\Develops\quests\practice> ls


    디렉터리: C:\Develops\quests\practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:50                backup
d-----      2025-07-15   오후 3:57                documents
d-----      2025-07-15   오후 3:57                images


PS C:\Develops\quests\practice> rm -a backup
Remove-Item : 매개 변수 이름 'a'과(와) 일치하는 매개 변수를 찾을 수 없습
니다.
위치 줄:1 문자:4
+ rm -a backup
+    ~~
    + CategoryInfo          : InvalidArgument: (:) [Remove-Item], Parame
   terBindingException
    + FullyQualifiedErrorId : NamedParameterNotFound,Microsoft.PowerShel
   l.Commands.RemoveItemCommand

PS C:\Develops\quests\practice> rm -f backup
Remove-Item : 매개 변수 이름 'f'이(가) 모호하므로 매개 변수를 처리할 수
없습니다. 일치하는 항목은 다음과 같습니다.  -Filter -Force.
위치 줄:1 문자:4
+ rm -f backup
+    ~~
    + CategoryInfo          : InvalidArgument: (:) [Remove-Item], Parame
   terBindingException
    + FullyQualifiedErrorId : AmbiguousParameter,Microsoft.PowerShell.Co
   mmands.RemoveItemCommand

PS C:\Develops\quests\practice> rm -item backup
Remove-Item : 매개 변수 이름 'item'과(와) 일치하는 매개 변수를 찾을 수 없
습니다.
위치 줄:1 문자:4
+ rm -item backup
+    ~~~~~
    + CategoryInfo          : InvalidArgument: (:) [Remove-Item], Parame
   terBindingException
    + FullyQualifiedErrorId : NamedParameterNotFound,Microsoft.PowerShel
   l.Commands.RemoveItemCommand

PS C:\Develops\quests\practice> rmdir backup

확인
C:\Develops\quests\practice\backup의 항목에는 하위 항목이 있으며 Recurse
매개 변수를 지정하지 않았습니다. 계속하면 해당 항목과 모든 하위 항목이
제거됩니다. 계속하시겠습니까?
[Y] 예(Y)  [A] 모두 예(A)  [N] 아니요(N)  [L] 모두 아니요(L)
[S] 일시 중단(S)[?] 도움말 (기본값은 "Y"): y
PS C:\Develops\quests\practice> ls


    디렉터리: C:\Develops\quests\practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:57                documents
d-----      2025-07-15   오후 3:57                images