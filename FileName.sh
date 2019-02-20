#!/bin/bash

mkdir $2
ExtensionsList=$@
num=0
AllFiles=$(find "`pwd`")
for file in $AllFiles
do
cnt=0
for Extension in $ExtensionsList
do
fileExt="${file##*.}" >/dev/null 2>&1
let cnt=cnt+1
if [[ cnt -ge 3 ]] && [ -f "$file" ] && [ $fileExt = $Extension ]
then
let num=num+1
cp /$file ~/$2/"$num"."$Extension" >/dev/null 2>&1
fi
done
done
tar -cf "$1".tar "$2" >/dev/null 2>&1
rm -R "$2" >/dev/null 2>&1

