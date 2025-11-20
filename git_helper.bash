#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam
# AuthorGit: Kaneki
# Simple Git Upload & Pull Helper




echo -e "
${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
${green}📤   imple Git Upload & Pull Helper  📤 ${reset}
${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
"

REPO_PATH="$PWD"
BRANCH="main"

function Kupload() {
    echo -e "📤 Uploading changes to Git...\n"
    git add .
    git commit -m "Auto upload $(date +'%Y-%m-%d_%H:%M:%S')" 
    git push origin $BRANCH
    echo -e "\n✅ Upload completed!"
}

function Kpull_changes() {
    echo -e "📥 Pulling latest changes from Git...\n"
    git pull origin $BRANCH
    echo -e "\n✅ Pull completed!"
    
}

function menu() {
    echo -e "\n──────── Kaneki Git Helper ────────\n"
    echo "1) Upload changes"
    echo "2) Pull changes"
    echo "3) Exit"
    echo -ne "\nChoose an option: "
    read choice
    case $choice in
        1) Kupload ;;
        2) Kpull_changes ;;
        3) exit 0 ;;
        *) echo -e "\n❌ Invalid option"; menu ;;
    esac
}

if [[ $1 == "Kupload" ]]; then
    Kupload
elif [[ $1 == "Kpull" ]]; then
    Kpull_changes
else
    menu
fi


if [[ -f "./install.bash" ]]; then
    echo -e "\n🚀 Running install.bash..."
    bash ./install.bash
fi