# 연습문제 1-1, 1-2

[hwang@localhost ~]$ tree
.
├── Desktop
├── Documents
├── Downloads
│   ├── project
│   │   ├── docs
│   │   ├── src
│   │   └── tests
│   └── sibling-project
│       ├── app
│       ├── config
│       └── lib
├── Music
├── my_project
│   ├── config
│   │   └── setting.conf
│   ├── docs
│   ├── README.md
│   ├── src
│   │   └── app.py
│   └── tests
├── my_project_backup
│   └── my_project
│       ├── config
│       │   └── setting.conf
│       ├── docs
│       │   └── README.md
│       ├── src
│       │   └── main.py
│       └── tests
├── Pictures
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
├── Public
├── temp
├── Templates
└── Videos


[hwang@localhost Downloads]$ mkdir -p ~/practice/project/{src,docs,tests,config}
[hwang@localhost Downloads]$ mkdir -p ~/practice/project/src/{main,utils}
[hwang@localhost Downloads]$ mkdir -p ~/practice/project/docs/{user,dev}
[hwang@localhost Downloads]$ mkdir -p ~/practice/project/tests/unit
[hwang@localhost Downloads]$ touch ~/practice/project/README.md
[hwang@localhost Downloads]$ touch ~/practice/project/src/utils/helper.py
[hwang@localhost Downloads]$ touch ~/practice/project/docs/user/manual.txt
[hwang@localhost Downloads]$ rm -r {backup, documents, media}
rm: cannot remove '{backup,': No such file or directory
rm: cannot remove 'documents,': No such file or directory
rm: cannot remove 'media}': No such file or directory
[hwang@localhost Downloads]$ rm -r ./practice/{backup, documents, media}
rm: cannot remove './practice/{backup,': No such file or directory
rm: cannot remove 'documents,': No such file or directory
rm: cannot remove 'media}': No such file or directory
[hwang@localhost Downloads]$ rm -r ./practice/backup
rm: cannot remove './practice/backup': No such file or directory
[hwang@localhost Downloads]$ cd ..
[hwang@localhost ~]$ rm -r ./practice/backup
[hwang@localhost ~]$ rm -r ./practice/documents
[hwang@localhost ~]$ rm -r ./practice/media
[hwang@localhost ~]$ touch ~/practice/project/docs/user/manual.txt
[hwang@localhost ~]$ touch ~/practice/project/docs/dev/api.md
[hwang@localhost ~]$ touch ~/practice/project/tests/test_main.py
[hwang@localhost ~]$ touch ~/practice/project/config/settings.conf
[hwang@localhost ~]$ touch ~/practice/project/src/main/app.py
[hwang@localhost ~]$ cd ./practice/project/src/main/
[hwang@localhost main]$ cd ./../utils/
[hwang@localhost utils]$ ls
helper.py
[hwang@localhost utils]$ cd ./../main/
[hwang@localhost main]$ ls
app.py

