#! /bin/sh

find ./* -name "*leetcode*md" 

FIND_REGEX='.*leetcode.*219.md'
FILES=`find . -type f -iregex "$FIND_REGEX"`

FROM="categories: \[程序人生\]"
FILTER="leetcode"
TO="categories: \[算法\]"
for f in $(grep -r "$FROM" . | grep "$FILTER" | awk -F: '{print $1}')
do
    echo $f
    sed -i "" "s/$FROM/$TO/" $f
done



FROM="tags: \[算法、leetcode、算法比赛\]"
FILTER="leetcode"
TO="tags: \[算法,leetcode,算法比赛\]"
for f in $(grep -r "$FROM" . | grep "$FILTER" | awk -F: '{print $1}')
do
    echo $f
    sed -i "" "s/$FROM/$TO/" $f
done





FROM="keywords: 程序人生"
FILTER="leetcode"
TO="keywords: 算法,leetcode,算法比赛"
for f in $(grep -r "$FROM" . | grep "$FILTER" | awk -F: '{print $1}')
do
    echo $f
    sed -i "" "s/$FROM/$TO/" $f
done


FROM="updateData:  2020-02-18 21:30:00"
FILTER="2020"
for f in $(grep -r "$FROM" . | grep "$FILTER" | awk -F: '{print $1}')
do
    t=$(echo $f | awk -F/ '{print $4}' | awk -F- '{print $1"-"$2"-"$3}')
    TO="updateData:  $t 21:30:00"
    sed -i "" "s/$FROM/$TO/" $f
done
    


