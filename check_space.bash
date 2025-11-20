#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

check_storage() {
    storage=$(df -h "$HOME" | awk 'NR==2 {print $4}' | tr 'i' 'B')
    [[ "$storage" == "0BB" ]] && storage="0B"

    echo -e "\n"
    echo -e "┌──────────────────────────────┐"
    echo -e "│   💾  STORAGE CHECK TOOL  💾 │"
    echo -e "└──────────────────────────────┘"
    echo -e "        📂 Home Directory"
    echo -e "\033[1;32m        ➜ Available: $storage ✅\033[0m"
    echo -e "\n"
}

check_storage
