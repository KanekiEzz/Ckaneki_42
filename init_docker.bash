#!/usr/bin/env bash
# Author : Ilyass Ezzam
# 42login: iezzam

[ -z "${USER}" ] && export USER=$(whoami)

################################################################################
docker_destination="/goinfre/$USER/docker"
################################################################################

blue=$'\033[0;34m'
cyan=$'\033[1;96m'
green=$'\033[1;32m'
red=$'\033[1;31m'
reset=$'\033[0;39m'

echo -e "
${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
${green}🐳  DOCKER RESET SCRIPT  🐳${reset}
${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
"

echo "${blue}❓ Do you want to uninstall Docker, Docker Compose, and Docker Machine installed with Homebrew?${reset}"
read -n1 -p "${blue}[${cyan}Y${blue}/${cyan}N${blue}] ${reset}" uninstall_choice
echo ""

if [ "$uninstall_choice" = "y" ] || [ "$uninstall_choice" = "Y" ]; then
    echo "${red}🗑 Uninstalling Docker packages installed with Homebrew...${reset}"
    brew uninstall -f docker docker-compose docker-machine &>/dev/null ;:
else
    echo "${green}⏭ Skipping Homebrew Docker uninstall.${reset}"
fi



if [ ! -d "/Applications/Docker.app" ] && [ ! -d "~/Applications/Docker.app" ]; then
    echo "${red}❌ Docker is not installed.${reset}"

    read -n1 -p "${blue}❓ Do you want to install ${cyan}Docker for Mac${blue}? [${cyan}Y${blue}/${cyan}N${blue}] ${reset}" install_choice
    echo ""

    if [ "$install_choice" = "y" ] || [ "$install_choice" = "Y" ]; then
        echo "${blue}👉 Opening ${cyan}Managed Software Center${blue}...${reset}"
        open -a "Managed Software Center"

        read -n1 -p "${blue}🔄 Press RETURN after installing ${cyan}Docker for Mac${blue}...${reset}"
        echo ""
    else
        echo "${red}🚫 Installation canceled. Docker is required to continue.${reset}"
        exit 1
    fi
fi


pkill Docker

if [ -d "$docker_destination" ]; then
    read -n1 -p "${red}⚠️  Folder ${cyan}$docker_destination${red} already exists, do you want to reset it? [${cyan}Y${red}/${cyan}N${red}]${reset} " input
    echo ""
    if [ -n "$input" ] && [ "$input" = "y" ]; then
        echo "${red}🧹 Cleaning old Docker data...${reset}"
        rm -rf "$docker_destination"/{com.docker.{docker,helper},.docker} &>/dev/null ;:
    fi
fi

unlink ~/Library/Containers/com.docker.docker &>/dev/null ;:
unlink ~/Library/Containers/com.docker.helper &>/dev/null ;:
unlink ~/.docker &>/dev/null ;:

rm -rf ~/Library/Containers/com.docker.{docker,helper} ~/.docker &>/dev/null ;:

mkdir -p "$docker_destination"/{com.docker.{docker,helper},.docker}

ln -sf "$docker_destination"/com.docker.docker ~/Library/Containers/com.docker.docker
ln -sf "$docker_destination"/com.docker.helper ~/Library/Containers/com.docker.helper
ln -sf "$docker_destination"/.docker ~/.docker

open -g -a Docker

echo -e "
${green}✅ Done!${reset} ${cyan}Docker${blue} is now starting... 🐋
"
