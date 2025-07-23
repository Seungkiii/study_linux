문제 : 

인자와 read를 함께 사용하여 변수 조합 출력

~$ 80_2_shell_variables_read.sh agument_first
read input : read_first

input values : agument_first read_first

```bash
[hwang@localhost ~/Downloads]$ source ./80_2_shell_variables_read.sh argument_first
read input : read_first 

input values : argument_first read_first
[hwang@localhost ~/Downloads]$ cat 80_2_shell_variables_read.sh 
read -p "read input : " argument_first
echo
echo "input values : $1 $argument_first"

```