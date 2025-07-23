#!/bin/bash

if [ $# -gt 2 ]; then
    echo "[❌] 오류: 인자는 최대 2개까지만 입력 가능합니다."
    echo "사용법: ./myscript.sh <파일이름> <메시지>"

else
    file_name="$1"
    message="$2"

    echo "$message" > $file_name

    echo "[✔] $file_name 파일이 성공적으로 생성되었습니다."
fi