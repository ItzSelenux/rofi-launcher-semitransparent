#!/usr/bin/env bash

echo "Welcome to the MintMenu Rofi Themes installer by ItzSelenux!"
echo "put e if you want to finish"
echo

xdg=${XDG_DATA_HOME:-${HOME}/.local/share}
DIRECTORY="${xdg}/rofi/themes/"

if [ ! -d "${DIRECTORY}" ]
then
    echo "Creating theme directory: ${DIRECTORY}"
    mkdir -p "${DIRECTORY}"
fi

declare -i ia=0
for themefile in **/*.rasi 
do
    if [ -f "${themefile}" ] && [ ${ia} -eq 0 ]
    then
        echo "Do you want to install '${themefile}'? y/N/a(ll)"
        read answer
        if [ x$answer = x"y" ]
        then
            echo "+Installing '${themefile}'"
            install "${themefile}" "${DIRECTORY}"
        elif [ x${answer} = x"e" ]
        then
            exit
        elif [ x${answer} = x"a" ]
        then
            ia=1
            echo "+Installing '${themefile}'"
            install "${themefile}" "${DIRECTORY}"
        else
            echo "+Skipping ${themefile}"
        fi 
    else
            echo "+Installing '${themefile}'"
            install "${themefile}" "${DIRECTORY}"
    fi
done
echo Done
