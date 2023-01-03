#!/bin/bash

echo Total number of folders \(including all nested ones\) = $(find $1 -type d | wc -l)
echo TOP 5 folders of maximum size arranged in descending order \(path and size\)
du -h $1 | sort -rh | head -5 | awk -F ' '  '{ printf("%d - %s, %s\n",1+i++, $2, $1)}'
echo Total number of files = $(find $1 -type f | wc -l)
echo Number of:
echo Configuration files \(with the .conf extension\) = $(find $1 -type f -name "*.conf" | wc -l)
echo Text files = $(find $1 -type f -name "*.txt" | wc -l)
echo Executable files = $(find $1 -type f -perm /111 | wc -l)
echo Log files \(with the extension .log\) = $(find $1 -type f -name "*.log" | wc -l)
echo Archive files = $(find $1 -type f -name "*.gz" -o -name "*.tgz" -o -name "*.tar" -o -name "*.zip" -o -name "*.rar"| wc -l)
echo Symbolic links = $(find $1 -type l -ls | wc -l)
echo TOP 10 files of maximum size arranged in descending order \(path, size and type\):
find $1 -xdev -type f | xargs ls -lh | sort -k5,5 -h -r | head -10 | awk -F ' ' '{printf("%d - %s, %s, ", 1+i++, $9, $5)} {system("file -ib " $9)}' | awk -F ' ' '{printf("%s - %s %s %s \n", $1, $3, $4, $5)}' 
echo TOP 10 executable files of the maximum size arranged \in descending order \(path, size and MD5 \hash of file\):
find $1 -type f -perm /111 | xargs ls -lh | sort -k5,5 -h -r | head -10 | awk -F ' ' '{printf("%d - %s, %s, ", 1+i++, $9, $5)} {system("md5sum " $9)}' | awk -F ' ' '{printf("%s - %s %s %s \n",$1, $3, $4, $5)}'
echo -n "Script execution time (in seconds) = "