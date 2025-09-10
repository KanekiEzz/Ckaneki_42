#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

# Detect user shell config file
if [[ $SHELL == *"zsh" ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ $SHELL == *"bash" ]]; then
    SHELL_RC="$HOME/.bashrc"
else
    # fallback (default zsh if unknown)
    SHELL_RC="$HOME/.zshrc"
fi

function deleteService() {
    shouldRemove='0'
    while read -r line
    do
        if [[ ! $line =~ $1 ]]; then
            if [ $shouldRemove == '0' ]; then
                echo "$line"
            fi
        else
            if [ $shouldRemove == '0' ]; then
                shouldRemove='1'
            elif [ $shouldRemove == '1' ]; then
                shouldRemove='0'
            fi
        fi
    done < "$SHELL_RC" > O1234567899876543210Darkmode

    cat O1234567899876543210Darkmode > "$SHELL_RC"
    rm -rf O1234567899876543210Darkmode
}

if [ "$1" == "active" ]; then
    if [ "$2" == "dark-mode" ]; then
        alreadyInstall=$(grep "####kaneki-Dark-mode10108####" < "$SHELL_RC")
        if [ ${#alreadyInstall} == 0 ]; then
            osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
            {
                echo -e "\n####kaneki-Dark-mode10108####"
                echo -e "osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to true'"
                echo -e "####kaneki-Dark-mode10108####"
            } >> "$SHELL_RC"
            echo -e "\n\033[1;32m🌙 Dark-mode activated ✅\033[0m\n"
        else
            echo -e "\n\033[1;31m⚠️ Dark-mode is already activated!\033[0m\n"
        fi
    fi

    if [ "$2" == "code" ]; then
    alreadyInstall=$(grep "####kaneki-code10108####" < "$SHELL_RC")
    if [ ${#alreadyInstall} == 0 ]; then
        os_type=$(uname)
        if [ "$os_type" == "Darwin" ]; then
            # ----- Mac -----
            {
                echo -e "\n####kaneki-code10108####"
                echo -e "alias code=\"/Applications/Visual\\ Studio\\ Code.app/Contents/Resources/app/bin/./code\""
                echo -e "####kaneki-code10108####"
            } >> "$SHELL_RC"
            echo -e "\n\033[1;32m💻 code command activated ✅ (Mac detected)\033[0m"
        elif [ "$os_type" == "Linux" ]; then
            # ----- Linux -----
            mkdir -p ~/.local/bin
            ln -sf /var/lib/flatpak/exports/bin/com.visualstudio.code ~/.local/bin/code
            {
                echo -e "\n####kaneki-code10108####"
                echo -e "export PATH=\$PATH:\$HOME/.local/bin"
                echo -e "####kaneki-code10108####"
            } >> "$SHELL_RC"
            echo -e "\n\033[1;32m💻 code command activated ✅ (Linux detected)\033[0m"
        else
            echo -e "\n\033[1;31m⚠️ Unsupported OS: $os_type\033[0m\n"
        fi
        echo -e "\033[1;31m(ℹ️ Reopen terminal to apply changes)\033[0m\n"
    else
        echo -e "\n\033[1;31m⚠️ code command is already activated!\033[0m\n"
    fi
fi


elif [ "$1" == "deactivate" ]; then
    if [ "$2" == "dark-mode" ]; then
        alreadyInstall=$(grep "####kaneki-Dark-mode10108####" < "$SHELL_RC")
        if [ ${#alreadyInstall} == 0 ]; then
            echo -e "\n\033[1;31m⚠️ Dark-mode is not activated!\033[0m\n"
        else
            osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'
            deleteService "####kaneki-Dark-mode10108####"
            echo -e "\n\033[1;32m🌞 Dark-mode deactivated ✅\033[0m\n"
        fi
    fi

    if [ "$2" == "code" ]; then
        alreadyInstall=$(grep "####kaneki-code10108####" < "$SHELL_RC")
        if [ ${#alreadyInstall} == 0 ]; then
            echo -e "\n\033[1;31m⚠️ code command is not activated!\033[0m\n"
        else
            deleteService "####kaneki-code10108####"
            echo -e "\n\033[1;32m🗑️ code command deactivated ✅\033[0m"
            echo -e "\033[1;31m(ℹ️ Reopen terminal to apply changes)\033[0m\n"
        fi
    fi

else
    echo -e "\033[1;35m

        █  ▄ ▗▞▀▜▌▄▄▄▄  ▗▞▀▚▖█  ▄ ▄ 
        █▄▀  ▝▚▄▟▌█   █ ▐▛▀▀▘█▄▀  ▄ 
        █ ▀▄      █   █ ▝▚▄▄▖█ ▀▄ █ 
        █  █                 █  █ █ 
                                    
    \033[0;32mCreated by Ilyass Ezzam\033[0m
    "

    echo -e "\033[0;33m✨ kaneki runs automatically when you open the terminal.\033[0m"
    echo -e "\n\033[1;35m------ 🛠️ Available Commands 🛠️ ------\033[0m\n"
    echo -e "   🧹 Clean computer              →  \033[4;36mkclean\033[0m\n"
    echo -e "   🐳 Run docker                  →  \033[4;36mkdocker\033[0m\n"
    echo -e "   💣 Full clean (dangerous)      →  \033[4;36mkcleanfull\033[0m\n"
    echo -e "   💾 Show free space             →  \033[4;36mstorage\033[0m\n"
    echo -e "   ❌ Uninstall kaneki            →  \033[4;36munkaneki\033[0m\n"
    echo -e "   🌙 Activate dark-mode          →  \033[4;36mkaneki active dark-mode\033[0m\n"
    echo -e "   🌞 Deactivate dark-mode        →  \033[4;36mkaneki deactivate dark-mode\033[0m\n"
    echo -e "   💻 Activate 'code' command     →  \033[4;36mkaneki active code\033[0m\n"
    echo -e "   🗑️ Deactivate 'code' command   →  \033[4;36mkaneki deactivate code\033[0m\n"
    echo -e "   📖 Show help                   →  \033[4;36mkaneki\033[0m\n"
fi
