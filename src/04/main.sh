#!/bin/bash
. ./myfuncs.sh
exec 0< ./config

var1=$(grep column1_background=[1-6] ./config)
if [[ $var1 ]]; then
    color1=$(echo $var1 | awk -F '=' '{print $2}' | sed s/[^1-6]//g)
    info1=$color1
fi
var2=$(grep column1_font_color=[1-6] ./config)
if [[ $var2 ]]; then
    color2=$(echo $var2 | awk -F '=' '{print $2}' | sed s/[^1-6]//g)
    info2=$color2
fi
var3=$(grep column2_background=[1-6] ./config)
if [[ $var3 ]]; then
    color3=$(echo $var3 | awk -F '=' '{print $2}' | sed s/[^1-6]//g)
    info3=$color3
fi
var4=$(grep column2_font_color=[1-6] ./config)
if [[ $var4 ]]; then
    color4=$(echo $var4 | awk -F '=' '{print $2}' | sed s/[^1-6]//g)
    info4=$color4
fi

if ! [[ $var1 ]] && ! [[ $var2 ]]; then
    color1=1
    color2=2
    info1="default"
    info2="default"
elif ! [[ $var1 ]]; then
    if [ $color2 -ne 1 ]; then
        color1=1
        info1="default"
    else
        color1=2
        info1="default"
    fi
elif ! [[ $var2 ]]; then
    if [ $color1 -ne 2 ]; then
        color2=2
        info2="default"
    else
        color2=1
        info2="default"

    fi
fi

if ! [[ $var3 ]] && ! [[ $var4 ]]; then
    color3=3
    color4=4
    info3="default"
    info4="default"
elif ! [[ $var3 ]]; then
    if [ $color4 -ne 3 ]; then
        color3=3
        info3="default"
    else
        color3=4
        info3="default"
    fi
elif ! [[ $var4 ]]; then
    if [ $color3 -ne 4 ]; then
        color4=4
        info4="default"
    else
        color4=3
        info4="default"
    fi
fi

if [ $color1 -eq $color2 ] || [ $color3 -eq $color4 ]; then
    echo "Значения цветов(1 и 2, 3 и 4) не должны совпадать."
    exit
fi

name_back=$( color $color1)
name_font=$( color $color2)
out_back=$( color $color3)
out_font=$( color $color4)

./getinfo.sh $name_back $name_font $out_back $out_font
echo
echo Column 1 background = $info1 \($(word $color1)\)
echo Column 1 font color = $info2 \($(word $color2)\)
echo Column 2 background = $info3 \($(word $color3)\)
echo Column 2 font color = $info4 \($(word $color4)\)
