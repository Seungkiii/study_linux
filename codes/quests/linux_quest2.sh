# 연습문제2
# 2-1
/home/hwang
[hwang@localhost ~]$ mkdir practice
[hwang@localhost ~]$ cd practice
[hwang@localhost practice]$ mkdir documents
[hwang@localhost practice]$ mkdir iamges
[hwang@localhost practice]$ rm iamges
rm: cannot remove 'iamges': Is a directory
[hwang@localhost practice]$ rmdir iamges
[hwang@localhost practice]$ mkdir images
[hwang@localhost practice]$ mkdir backup
[hwang@localhost practice]$ cd documents
[hwang@localhost documents]$ mkdir reports
[hwang@localhost documents]$ mkdir notes

# 2-2
[hwang@localhost documents]$ "Hello Linux" > readme.txt
bash: Hello Linux: command not found...
[hwang@localhost documents]$ echo "Hello Linux" > readme.txt
[hwang@localhost documents]$ cd ..
[hwang@localhost practice]$ cd notes
bash: cd: notes: No such file or directory
[hwang@localhost practice]$ cd documents/notes
[hwang@localhost notes]$ echo "Linux" > memo.txt
[hwang@localhost notes]$ ls
memo.txt
[hwang@localhost notes]$ cat memo.txt
Linux
