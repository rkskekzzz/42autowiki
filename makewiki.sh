#!/bin/bash

# auto make file & pull, push for wiki

# Proejct Path 
PROJ_PATH=${1}

# Make File
./macro.sh

# Check File
ls -al
echo "생성할 파일을 확인하였습니까\(y/n\)?"
read yn
if [ "${yn}" == "y" ]; then
	mv 2*.md $PROJ_PATH/
	echo "만들기 끝"
elif [ "${yn}" == "n" ]; then
	rm -rf ./2*.md
	echo "만들기 취소"
fi
