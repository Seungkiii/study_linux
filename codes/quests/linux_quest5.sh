# 연습문제 5
# 5-1
[hwang@localhost ~]$ mkdir my_project
[hwang@localhost ~]$ cd my_project
[hwang@localhost my_project]$ mkdir src, docs, tests, config
[hwang@localhost my_project]$ ls
config  docs,  src,  tests,
[hwang@localhost my_project]$ cd src
bash: cd: src: No such file or directory
[hwang@localhost my_project]$ rmdir src, docs, tests,
[hwang@localhost my_project]$ ls
config
[hwang@localhost my_project]$ mkdir src
[hwang@localhost my_project]$ mkdir docs
[hwang@localhost my_project]$ mkdir tests
[hwang@localhost my_project]$ ls
config  docs  src  tests
[hwang@localhost my_project]$ cd src
[hwang@localhost src]$ echo "# Main Python File" > main.py
[hwang@localhost src]$ cd ..
[hwang@localhost my_project]$ cd docs
[hwang@localhost docs]$ echo "# My Project Documentation" > README.md
[hwang@localhost docs]$ cd ..
[hwang@localhost my_project]$ cd config
[hwang@localhost config]$ echo "# Configuration File" > setting.conf
[hwang@localhost config]$ ls
setting.conf

# 5-2
[hwang@localhost ~]$ cp -r my_project my_project_backup
[hwang@localhost ~]$ cd my_proejct_backup
bash: cd: my_proejct_backup: No such file or directory
[hwang@localhost ~]$ ls
Desktop    Downloads  my_project         Pictures  Public     Videos
Documents  Music      my_project_backup  practice  Templates
[hwang@localhost ~]$ cd my_project_backup
[hwang@localhost my_project_backup]$ ls
my_project

[hwang@localhost my_project_backup]$ cd ..
[hwang@localhost ~]$ cd my_project/src
[hwang@localhost src]$ mv main.py app.py
[hwang@localhost src]$ ls
app.py
[hwang@localhost src]$ cd ..
[hwang@localhost my_project]$ cd docs
[hwang@localhost docs]$ mv README.md /home/hwang/my_project
[hwang@localhost docs]$ cd ..
[hwang@localhost my_project]$ ls
config  docs  README.md  src  tests
