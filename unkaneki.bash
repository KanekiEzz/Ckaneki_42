#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

# Colors
red=$'\033[1;31m'
yellow=$'\033[0;33m'
green=$'\033[0;32m'
cyan=$'\033[0;36m'
reset=$'\033[0m'

marker="####10108kaneki10108####"
tmpfile="O1234567899876543210"

alreadyInstall=$(grep "$marker" < ~/.zshrc)

if [ ${#alreadyInstall} -eq 0 ]; then
    echo -e "\n${red}❌ Ckaneki is not installed!${reset}\n"
else
    shouldRemove=0
    while read -r line; do
        if [[ ! $line =~ $marker ]]; then
            [ $shouldRemove -eq 0 ] && echo "$line"
        else
            # toggle between inside/outside marker section
            if [ $shouldRemove -eq 0 ]; then
                shouldRemove=1
            else
                shouldRemove=0
            fi
        fi
    done < ~/.zshrc > "$tmpfile"

    mv "$tmpfile" ~/.zshrc

    # Fancy goodbye banner
    echo -e "${yellow}
        █  ▄ ▗▞▀▜▌▄▄▄▄  ▗▞▀▚▖█  ▄ ▄ 
        █▄▀  ▝▚▄▟▌█   █ ▐▛▀▀▘█▄▀  ▄ 
        █ ▀▄      █   █ ▝▚▄▄▖█ ▀▄ █ 
        █  █                 █  █ █ 
${green}           👋 Ckaneki uninstalled successfully! ${reset}
"
fi
