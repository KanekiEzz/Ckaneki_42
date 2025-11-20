#!/bin/bash
# Author: Kaneki
# Simple Git Upload & Pull Helper

# Detect current repo path and default branch
REPO_PATH="$PWD"
BRANCH="${BRANCH:-main}"   # uses environment variable BRANCH if set, else 'main'

# Colors
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[0;33m"
MAGENTA="\033[1;35m"
RESET="\033[0m"

function Kupload() {
    echo -e "${CYAN}📤 Uploading changes to Git...${RESET}\n"
    git add .
    git commit -m "Auto upload $(date +'%Y-%m-%d_%H:%M:%S')" 
    git push origin "$BRANCH"
    echo -e "\n${GREEN}✅ Upload completed!${RESET}"
}

function Kpull_changes() {
    echo -e "${CYAN}📥 Pulling latest changes from Git...${RESET}\n"
    git pull origin "$BRANCH"
    echo -e "\n${GREEN}✅ Pull completed!${RESET}"
}

function menu() {
    echo -e "\n${MAGENTA}──────── Kaneki Git Helper ────────${RESET}\n"
    echo "1) Upload changes"
    echo "2) Pull changes"
    echo "3) Exit"
    echo -ne "\nChoose an option: "
    read choice
    case $choice in
        1) Kupload ;;
        2) Kpull_changes ;;
        3) exit 0 ;;
        *) echo -e "\n${YELLOW}❌ Invalid option${RESET}"; menu ;;
    esac
}

# Make script executable automatically
chmod +x "$0"

# If argument passed, run directly
if [[ $1 == "Kupload" ]]; then
    Kupload
elif [[ $1 == "Kpull" ]]; then
    Kpull_changes
else
    menu
fi
