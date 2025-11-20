#!/usr/bin/env bash


if ! command -v zsh >/dev/null 2>&1; then
    echo "Zsh not found — installing..."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed."
fi

echo "✔ Done! Restart your terminal."
