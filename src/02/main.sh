#!/bin/bash

./getinfo.sh
read -p "Хотитет сохранить в файл [Y/N]? " var
if [ "$var" = "y" ] || [ "$var" = "Y" ]; then
    ./getinfo.sh > $(date +"%d_%m_%y_%H_%M_%S.status")
fi