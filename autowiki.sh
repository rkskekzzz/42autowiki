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

# Project PATH
PROJ_PATH=/Users/su/Desktop/report.wiki

# Values 
type=${1}
date=${2}
year=20210000

# To avoid git crash
cd $PROJ_PATH
git pull
echo "*********** finish git pull ************"
cd -
echo 

# if 
if [ "${type}" == "m" -o "${type}" == "" ]; then
	echo "************* start make! ***************"
	bash makewiki.sh $PROJ_PATH
elif [ "${type}" == "r" -o "${date}" != "" ]; then
	echo start remove!
	for n in 0 1 2 3 4
	do
		rmdate=`expr $year + $date + $n`
		rm -rvf $PROJ_PATH/*${rmdate}*
	done
	echo end remove!
fi

