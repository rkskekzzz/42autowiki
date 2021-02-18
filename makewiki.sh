#!/bin/bash

# auto make file & pull, push for wiki

# 프로젝트 PATH 
PROJ_PATH=${1}

# before start program
#git pull

# Values
year=20210000
weekday=("(월)" "(화)" "(수)" "(목)" "(금)")

# Input Value
echo -e "생성할 주차의 월요일 날짜의 월, 일을 입력하세요 (ex. mmdd) "
read date
echo "******************************************"
# Make file
for n in 0 1 2 3 4 
do
	word=`expr $year + $date + $n`
	result=$word${weekday[n]}
	echo "생성된 파일 $n : $result.md"
	cat ./form.txt > $result.md
	sed -i "" "s/DATETIME/$result/" $result.md
done
echo "******************************************"
echo 생성할 파일을 확인하였습니까\(y/n\)?
read yn
if [ "${yn}" == "y" ]; then
	mv *.md $PROJ_PATH/
	echo 모든 파일을 옮겼습니다!!!!
	echo PATH = $PROJ_PATH
elif [ "${yn}" == "n" ]; then
	rm -rf ./*.md
	echo 임시 파일을 제거하였습니다!!!
fi

# after program
#git push
