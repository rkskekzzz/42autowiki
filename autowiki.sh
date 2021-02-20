#!/bin/bash

# this program is autowiki program           
#                                            
#         HOW TO MAKE FILE ?                 
# bash autowiki.sh 'm' or none to  make wiki 
#                                            
#                                            
#         HOW TO REMOVE WEEK ?               
# bash autowiki.sh 'r' to remove wiki        
#    !!!! 'mmdd' is must be Monday !!!!      
#                                            

# Project Path
PROJ_PATH=

# Values
type=${1}

# To Avoid Git Crash
cd $PROJ_PATH
git pull
echo "Git Pull 끝"
cd -
echo 

# Branch 
if [ "${type}" == "m" -o "${type}" == "" ]; then
	echo "만들기 시작"
	bash makewiki.sh $PROJ_PATH
elif [ "${type}" == "r" -o "${date}" != "" ]; then
	echo "지우기 시작"
		rm -rvf $PROJ_PATH/
	echo "지우기 끝"
fi
