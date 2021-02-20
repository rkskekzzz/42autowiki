#!/bin/bash

#     this program is autowiki program       
#                                            
#         HOW TO MAKE FILE ?                 
#  ./autowiki.sh '5' or none to  make wiki   
#                                            
#                                            
#         HOW TO REMOVE FILE ?               
#  ./autowiki.sh 'r' 'mmdd' to remove wiki   
#    !!!! 'mmdd' must be needed !!!!         
#                                            

# Project Path
PROJ_PATH=/Users/suhshin/Desktop

# Values
type=${1}
date=${2}
array=()

# To Avoid Git Crash
cd $PROJ_PATH
git pull
echo "Git Pull 끝"
cd -
echo 

function prborder () {
    local str="${array[0]}"
    local len=${#str}
	local arr_len=${#array[@]}
    local i
    for (( i = 0; i < len + 4; ++i )); do
        printf '-'
    done
	for ((i = 0 ; i < ${arr_len} ; i++))
	do
    	printf "\n| ${array[i]} |"
	done
	echo 
    for (( i = 0; i < len + 4; ++i )); do
        printf '-'
    done
    echo
}

# Branch 
if [ "${type}" == "wd" -o "${type}" == "" ]; then
	echo "만들기 시작"
	bash macro.sh $type
	#  find to array  #
	while IFS=  read -r -d $'\0'; do
    	array+=("$REPLY")
	done < <(find . -name "2*md" -print0)
	#  print border and files  #
	prborder
	echo -ne "생성한 파일을 확인하였습니까(y/n)?\t"
	read yn
	if [ "${yn}" == "y" ]; then
		mv 2*.md $PROJ_PATH/
		echo "만들기 끝"
	elif [ "${yn}" == "n" ]; then
		rm -rf ./2*.md
		echo "만들기 취소"
	fi
elif [ "${type}" == "r" -o "${date}" != "" ]; then
	echo "지우기 시작"
		rm -rvf $PROJ_PATH/2021${date}*
	echo "지우기 끝"
fi

