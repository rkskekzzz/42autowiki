# !/bin/bash

# Wiki Path
WIKI_PATH=/Users/bigpel/Desktop/report.wiki

function calc_offset()
{
	count=0
	day="(`echo $(date +%a)`)"
	weekday=("(월)" "(화)" "(수)" "(목)" "(금)" "(토)" "(일)")
	
	for i in ${weekday[@]}
	do
		if [ ${day} == ${i} ]; then
			break
		fi
		count=$((count + 1))
	done
	echo ${count}
}

function make_file()
{
	for ((i = 0; i < 7; i++))
	do
		offset=$((${1} - i))
		if [ ${offset} -ge 0 ]; then
			day="(`echo $(date -v-${offset}d +%a)`)"
			date=`echo $(date -v-${offset}d +%Y%m%d)`
		else
			offset=$((offset * -1))
			day="(`echo $(date -v+${offset}d +%a)`)"
			date=`echo $(date -v+${offset}d +%Y%m%d)`
		fi
		name=`echo ${date}${day}`
		cat ./form.txt > ${name}.md
		sed -i "" "s/DATETIME/${name}/" ${name}.md
	done
}

echo 오프셋 계산 중...
offset=`calc_offset`
echo 파일 생성 중...
make_file ${offset}
echo 파일 이동 중...
#mv 2*.md ${WIKI_PATH}/
echo WIKI 디렉토리에 파일이 생성되었습니다.
