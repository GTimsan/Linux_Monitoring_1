
function color {
    if [ $1 == 1 ]; then
    var=7
    elif [ $1 == 2 ]; then
    var=1
    elif [ $1 == 3 ]; then
    var=2
    elif [ $1 == 4 ]; then
    var=4
    elif [ $1 == 5 ]; then
    var=5
    elif [ $1 == 6 ]; then
    var=0
    fi
    echo $(( $var))
}