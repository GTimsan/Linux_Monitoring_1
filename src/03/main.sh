#!/bin/bash
. ./myfuncs.sh

if [ $# -ne 4 ]
then
    echo "Введите 4 параметра"
else
    for param in $@
    do
        if ! [[ "$param" =~ ^[1-6]?$ ]]; then
            echo "Параметры должны быть цифрами 1 - 6"
            exit
        fi
    done
    if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
        echo "Значения цветов(1 и 2, 3 и 4) не должны совпадать."
        read -p "Хотите вызвать скрипт повторно?(введите корректные параметры) [Y/N] " var par1 par2 par3 par4
        if [ "$var" = "y" ] || [ "$var" = "Y" ]; then
            ./main.sh $par1 $par2 $par3 $par4
            exit
        else
            exit
        fi
    fi
    name_back=$( color $1)
    name_font=$( color $2)
    out_back=$( color $3)
    out_font=$( color $4)
    ./getinfo.sh $name_back $name_font $out_back $out_font
fi


