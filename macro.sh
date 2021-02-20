# !/bin/zsh

# Variables
day="(`echo $(date +%a)`)"
weekday=("(월)" "(화)" "(수)" "(목)" "(금)" "(토)" "(일)")
offset=0

# Directory
#cd ${WIKI_PATH}

for i in "${weekday[@]}"
do
	if [ ${day} == ${i} ]; then
		break
	fi
	offset=$((offset + 1))
done

for ((i = 0; i <= offset; i++))
do
	day="(`echo $(date -v-${i}d +%a)`)"
	date="`echo $(date -v-${i}d +%Y%m%d)`"
	name=`echo ${date}${day}`
	cat ./form.txt > ${name}.md
done

for (( i = 1; i < 7 - offset; i++))
do
	day="(`echo $(date -v+${i}d +%a)`)"
	date="`echo $(date -v+${i}d +%Y%m%d)`"
	name=`echo ${date}${day}`
	cat ./form.txt > ${name}.md
done
