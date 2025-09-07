#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

StorageBefore=$(df -h "$HOME" | awk 'NR==2 {print $4}' | tr 'i' 'B')
[[ "$StorageBefore" == "0BB" ]] && StorageBefore="0B"

echo -e "\n"
echo -e "┌───────────────────────────────────────┐"
echo -e "│   🧹  KANEKI'S SUPER CLEANER v2.0  🧹 │"
echo -e "└───────────────────────────────────────┘"
echo -e "   💻 Cleaning caches and temp files..."
echo -e ""
echo -e ""

clean42Caches() {
    /bin/rm -rf ~/Library/*.42* &>/dev/null
    /bin/rm -rf ~/*.42* &>/dev/null
    /bin/rm -rf ~/.zcompdump* &>/dev/null
    /bin/rm -rf ~/.cocoapods.42_cache_bak* &>/dev/null
}

cleanGeneralCacheFiles() {
    /bin/rm -rf ~/Library/Caches/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Caches/* &>/dev/null
}

cleanAppsCaches() {
    /bin/rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/discord/Cache/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/discord/Code\ Cache/js* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Application\ Cache/* &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
}

cleanDS_StoreFiles() {
    find ~/Desktop -name .DS_Store -depth -exec /bin/rm {} \; &>/dev/null
}

cleanTmpDownloadsFiles() {
    /bin/rm -rf ~/Library/Application\ Support/Chromium/Default/File\ System &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/File\ System &>/dev/null
    /bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System &>/dev/null
}

cleanPoolThings() {
    /bin/rm -rf ~/Desktop/Piscine\ Rules\ *.mp4 &>/dev/null
    /bin/rm -rf ~/Desktop/PLAY_ME.webloc &>/dev/null
}

cleanFlatpakAppCaches() {
    flatpak_base="$HOME/.var/app"

    if [ -d "$flatpak_base" ]; then
        for app_dir in "$flatpak_base"/*; do
            cache_path="$app_dir/cache"
            if [ -d "$cache_path" ]; then
                app_name=$(basename "$app_dir")
                echo -e "   🧽 Clearing cache for: \033[1;36m$app_name\033[0m"
                rm -rf "$cache_path"/* &>/dev/null
            fi
        done
    fi
}

cleanUserCacheDir() {
    if [ -d "$HOME/.cache" ]; then
        echo -e "   🧽 Clearing \033[1;36m~/.cache\033[0m ..."
        rm -rf "$HOME/.cache"/* &>/dev/null
    fi
}

# Run all cleaning functions
clean42Caches
cleanGeneralCacheFiles
cleanAppsCaches
cleanDS_StoreFiles
cleanTmpDownloadsFiles
cleanPoolThings
cleanFlatpakAppCaches
cleanUserCacheDir

Storage=$(df -h "$HOME" | awk 'NR==2 {print $4}' | tr 'i' 'B')
[[ "$Storage" == "0BB" ]] && Storage="0B"

echo -e "\n"
echo -e "┌─────────────────────────────┐"
echo -e "│   📊  STORAGE COMPARISON    │"
echo -e "└─────────────────────────────┘"
echo -e "   🔴 Before : \033[1;31m$StorageBefore\033[0m"
echo -e "   🟢 After  : \033[1;32m$Storage\033[0m"
echo -e ""
