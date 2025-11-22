#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

blue=$'\033[0;34m'
cyan=$'\033[1;96m'
green=$'\033[1;32m'
red=$'\033[1;31m'
reset=$'\033[0;39m'

echo -e "
${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
${green}        🔄 Linux RESET SCRIPT  ❌${reset}
${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
"

echo -e "   ❌💾  ${red}kreset${reset}   →  ${cyan}reset session${reset}"
echo -e "   🔄🖥️  ${yellow}kreboot${reset}  →  ${cyan}restart PC${reset}\n"

read -p "Do you want to reset session ? (yes/no): "

if [[ "$q1" == "yes" ]]; then
    echo "[INFO] Resetting session ..."
    touch "$HOME/.reset"
else
    echo "[INFO] Session reset cancelled."
fi

read -p "Do you want to restart the PC? (yes/no): "

if [[ "$q2" == "yes" ]]; then
    echo "[INFO] Restarting the PC..."
    kill -11 -1
else
    echo "[INFO] Restart cancelled."
fi

touch "$HOME/.reset"

echo "Done!"
