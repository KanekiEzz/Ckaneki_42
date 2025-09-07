#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

startInstall() {
    echo -e "\n⚙️  ${cyan}Installing...${reset}\n"
    path=$(pwd)
    kanekiPath="$path/cleaner.bash"
    alreadyInstall=$(grep "####10108kaneki10108####" < ~/.zshrc)

    if [ ${#alreadyInstall} == 0 ]; then
        {
            echo $'\n\n\n####10108kaneki10108####'
            echo "alias storage=\"bash $path/check_space.bash\""
            echo "alias kaneki=\"bash $path/help.bash\""
            echo "alias unkaneki=\"bash $path/unkaneki.bash\""
            echo "alias kdocker=\"bash $path/init_docker.bash\""
            echo "alias kclean=\"bash $kanekiPath\""
            echo "alias kcleanfull=\"bash $path/cleanAllAppsData.bash\""
            [ "$1" == '1' ] && echo "/bin/bash $kanekiPath"
            echo "####10108kaneki10108####"
        } >> ~/.zshrc

        echo -e "${green}✅ Installed successfully!${reset}"
        echo -e "\n${red}⚠️  Please reopen terminal to apply changes.${reset}\n"
    else
        echo -e "${green}✅ Already installed!${reset}\n"
    fi
}

# Colors
cyan=$'\033[0;36m'
yellow=$'\033[0;33m'
green=$'\033[1;32m'
red=$'\033[1;31m'
reset=$'\033[0m'

# Banner
echo -e "${yellow}
        █  ▄ ▗▞▀▜▌▄▄▄▄  ▗▞▀▚▖█  ▄ ▄ 
        █▄▀  ▝▚▄▟▌█   █ ▐▛▀▀▘█▄▀  ▄ 
        █ ▀▄      █   █ ▝▚▄▄▖█ ▀▄ █ 
        █  █                 █  █ █ 

${cyan}       🚀  kaneki Installer by ${green}Ilyass Ezzam${reset}
"

# Menu
echo -e "${cyan}[1]${green} 🚀 Full Install ${reset} ➤ (Install + auto-run on terminal startup)"
echo -e "${cyan}[2]${yellow} ⚡ Just Install ${reset} ➤ (Use kaneki command manually)\n"
echo -ne "─➤ ${cyan}"

read -p "" var

case "$var" in
    1) startInstall '1' ;;
    2) startInstall ;;
    *) echo -e "${red}❌ Invalid choice. Exiting...${reset}" ;;
esac
