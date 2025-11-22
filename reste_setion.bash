#!/bin/bash
# Author  : Ilyass Ezzam
# 42login : iezzam

echo "=== QUESTION 1 ==="
read -p "Do you want to reset session 2? (yes/no): " q1

if [[ "$q1" == "yes" ]]; then
    echo "[INFO] Resetting session 2..."
    touch .reset
else
    echo "[INFO] Session reset cancelled."
fi

echo "=== QUESTION 2 ==="
read -p "Do you want to restart the PC? (yes/no): " q2

if [[ "$q2" == "yes" ]]; then
    echo "[INFO] Restarting the PC..."
    kill -11 -1
else
    echo "[INFO] Restart cancelled."
fi

touch "$HOME/reset"

echo "Done!"
