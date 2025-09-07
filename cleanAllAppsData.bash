#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

clearAllAppsData() {
    echo -e "\n"
    echo -e "┌──────────────────────────────┐"
    echo -e "│   🧹  CLEANING TOOL v1.0  🧹 │"
    echo -e "└──────────────────────────────┘"
    echo -e "        🗑️  Removing ~/Library ..."
    
    /bin/rm -rf ~/Library &>/dev/null
    
    storage=$(df -h "$HOME" | awk 'NR==2 {print $4}' | tr 'i' 'B')
    [[ "$storage" == "0BB" ]] && storage="0B"

    echo -e "\n\033[1;32m        💾 Available storage: $storage ✅\033[0m\n"
}

clearAllAppsData
