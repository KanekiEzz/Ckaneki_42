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

elif [ "$1" == "open" ]; then
    # ----- Open selected apps only -----
    echo -e "\n📱 Select an app to open:\n"

    # Hardcoded list of apps
    apps=("Settings" "Bluetooth" "Run Command (Alt+F2)" "Print R" "Discord" "Spotify" "Firefox" "Chrome" "Chromium" "Calculator" "Visual Studio Code" "VirtualBox")

    # Show numbered list
    for i in "${!apps[@]}"; do
        printf "%3d) %s\n" $((i+1)) "${apps[$i]}"
    done

    echo -ne "\nEnter the number of the app to open: "
    read -r choice

    if [[ $choice -ge 1 && $choice -le ${#apps[@]} ]]; then
        app="${apps[$((choice-1))]}"
        echo -e "\n🚀 Opening $app..."

        os_type=$(uname)
        if [[ "$os_type" == "Darwin" ]]; then
            case "$app" in
                "Settings") open "/System/Applications/System Settings.app" ;;
                "Bluetooth") open "/System/Applications/System Settings.app" ;; 
                "Discord") open -a Discord ;;
                "Spotify") open -a Spotify ;;
                "Firefox") open -a Firefox ;;
                "Chrome") open -a "Google Chrome" ;;
                "Chromium") open -a Chromium ;;
                "Calculator") open -a Calculator ;;
                "Visual Studio Code") open -a "Visual Studio Code" ;;
                "VirtualBox") open -a VirtualBox ;;
                *) echo "Cannot open $app on Mac" ;;
            esac
        elif [[ "$os_type" == "Linux" ]]; then
            case "$app" in
                "Settings") gnome-control-center >/dev/null 2>&1 ;; 
                "Bluetooth") bluetoothctl >/dev/null 2>&1 ;; 
                "Run Command (Alt+F2)") echo "Use Alt+F2 manually to run commands" ;;
                "Print R") echo "No direct app, use your print dialog" ;;
                "Discord") discord >/dev/null 2>&1 & ;;
                "Spotify") spotify >/dev/null 2>&1 & ;;
                "Firefox") firefox >/dev/null 2>&1 & ;;
                "Chrome") google-chrome >/dev/null 2>&1 & ;;
                "Chromium") chromium-browser >/dev/null 2>&1 & ;;
                "Calculator") gnome-calculator >/dev/null 2>&1 & ;;
                "Visual Studio Code") code >/dev/null 2>&1 & ;;
                "VirtualBox") virtualbox >/dev/null 2>&1 & ;;
                *) echo "Cannot open $app on Linux" ;;
            esac
        else
            echo -e "\033[1;31mUnsupported OS\033[0m"
        fi
    else
        echo -e "\033[1;31mInvalid choice\033[0m"
    fi
    exit 0

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
    echo -e "   🌀 Install Oh My Zsh           →  \033[4;36mkzsh\033[0m\n"
    echo -e "   ❌ Uninstall kaneki            →  \033[4;36munkaneki\033[0m\n"
    echo -e "   🌙 Activate dark-mode          →  \033[4;36mkaneki active dark-mode\033[0m\n"
    echo -e "   🌞 Deactivate dark-mode        →  \033[4;36mkaneki deactivate dark-mode\033[0m\n"
    echo -e "   💻 Activate 'code' command     →  \033[4;36mkaneki active code\033[0m\n"
    echo -e "   🗑️ Deactivate 'code' command   →  \033[4;36mkaneki deactivate code\033[0m\n"
    echo -e "   📱 Open an app                 →  \033[4;36mkaneki open\033[0m\n"
    echo -e "   📖 Show help                   →  \033[4;36mkaneki\033[0m\n"
fi
