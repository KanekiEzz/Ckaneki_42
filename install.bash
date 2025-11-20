#!/bin/bash
# Author: Ilyass Ezzam
# 42login: iezzam

# Detect user shell config file
if [[ $SHELL == *"zsh" ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ $SHELL == *"bash" ]]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.zshrc"
fi

LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$LOCAL_BIN"

# Path to git helper script (create this script separately)
gitHelper="$PWD/git_helper.sh"

startInstall() {
    echo -e "\n⚙️  Installing Kaneki aliases, symlinks, auto-run kclean...\n"
    path=$(pwd)
    kanekiPath="$path/cleaner.bash"

    # Add aliases if not already
    alreadyInstall=$(grep "####10108kaneki10108####" < "$SHELL_RC")
    if [ ${#alreadyInstall} == 0 ]; then
        {
            echo $'\n\n\n####10108kaneki10108####'
            echo "alias storage=\"bash $path/check_space.bash\""
            echo "alias kaneki=\"bash $path/help.bash\""
            echo "alias unkaneki=\"bash $path/unkaneki.bash\""
            echo "alias kdocker=\"bash $path/init_docker.bash\""
            echo "alias kzsh=\"bash $path/install_oh-my-zsh.bash\""
            echo "alias kclean=\"bash $kanekiPath\""
            echo "alias kcleanfull=\"bash $path/cleanAllAppsData.bash\""
            echo "alias Kupload=\"bash $gitHelper upload\""
            echo "alias Kpull=\"bash $gitHelper pull\""
            echo "####10108kaneki10108####"
        } >> "$SHELL_RC"

        # Auto-run kclean on terminal open
        grep -qxF "bash $kanekiPath" "$SHELL_RC" || echo "bash $kanekiPath" >> "$SHELL_RC"
    fi

    # Create symlinks
    ln -sf "$kanekiPath" "$LOCAL_BIN/kclean"
    ln -sf "$path/help.bash" "$LOCAL_BIN/kaneki"
    ln -sf "$path/unkaneki.bash" "$LOCAL_BIN/unkaneki"
    ln -sf "$path/init_docker.bash" "$LOCAL_BIN/kdocker"
    ln -sf "$path/check_space.bash" "$LOCAL_BIN/storage"
    ln -sf "$path/install_oh-my-zsh.bash" "$LOCAL_BIN/kzsh"
    ln -sf "$path/cleanAllAppsData.bash" "$LOCAL_BIN/kcleanfull"
    ln -sf "$gitHelper" "$LOCAL_BIN/git_helper"
    ln -sf "$gitHelper" "$LOCAL_BIN/upload"
    ln -sf "$gitHelper" "$LOCAL_BIN/pull"

    chmod +x "$LOCAL_BIN/"*

    # Add ~/.local/bin to PATH if missing
    grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC" || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"

    # Reload shell
    source "$SHELL_RC"

    echo -e "${green}✅ Installed successfully!${reset}"
    echo -e "${green}⚡ Aliases, symlinks, and auto-run kclean are ready in this and all new terminals.${reset}"
}

forceReinstall() {
    echo -e "\n♻️  Forcing reinstall...\n"
    path=$(pwd)
    kanekiPath="$path/cleaner.bash"

    # Remove old aliases block
    sed -i '/####10108kaneki10108####/,/####10108kaneki10108####/d' "$SHELL_RC"

    # Re-add aliases and auto-run kclean
    {
        echo $'\n\n\n####10108kaneki10108####'
        echo "alias storage=\"bash $path/check_space.bash\""
        echo "alias kaneki=\"bash $path/help.bash\""
        echo "alias unkaneki=\"bash $path/unkaneki.bash\""
        echo "alias kdocker=\"bash $path/init_docker.bash\""
        echo "alias kzsh=\"bash $path/install_oh-my-zsh.bash\""
        echo "alias kclean=\"bash $kanekiPath\""
        echo "alias kcleanfull=\"bash $path/cleanAllAppsData.bash\""
        echo "alias Kupload=\"bash $gitHelper Kupload\""
        echo "alias Kpull=\"bash $gitHelper Kpull\""
        echo "####10108kaneki10108####"
    } >> "$SHELL_RC"

    grep -qxF "bash $kanekiPath" "$SHELL_RC" || echo "bash $kanekiPath" >> "$SHELL_RC"

    # Recreate symlinks
    ln -sf "$kanekiPath" "$LOCAL_BIN/kclean"
    ln -sf "$path/help.bash" "$LOCAL_BIN/kaneki"
    ln -sf "$path/unkaneki.bash" "$LOCAL_BIN/unkaneki"
    ln -sf "$path/init_docker.bash" "$LOCAL_BIN/kdocker"
    ln -sf "$path/check_space.bash" "$LOCAL_BIN/storage"
    ln -sf "$path/install_oh-my-zsh.bash" "$LOCAL_BIN/kzsh"
    ln -sf "$path/cleanAllAppsData.bash" "$LOCAL_BIN/kcleanfull"
    ln -sf "$gitHelper" "$LOCAL_BIN/git_helper"
    ln -sf "$gitHelper" "$LOCAL_BIN/Kupload"
    ln -sf "$gitHelper" "$LOCAL_BIN/Kpull"

    chmod +x "$LOCAL_BIN/"*

    grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC" || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"

    source "$SHELL_RC"

    echo -e "${green}✔ Reinstalled successfully!${reset}"
    echo -e "${green}⚡ Aliases, symlinks, and auto-run kclean are ready in all terminals.${reset}"
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
echo -e "${cyan}[2]${yellow} ⚡ Just Install ${reset} ➤ (Use kaneki command manually)"
echo -e "${cyan}[3]${yellow} 🔄 Reinstall / Update ${reset} ➤ (Rewrite kaneki aliases, symlinks, and auto-run)\n"

echo -ne "─➤ ${cyan}"
read -p "" var

case "$var" in
    1) startInstall '1' ;;
    2) startInstall ;;
    3) forceReinstall ;;
    *) echo -e "${red}❌ Invalid choice. Exiting...${reset}" ;;
esac
