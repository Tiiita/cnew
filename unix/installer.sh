#!/bin/bash

TARGET_DIR="$HOME/bin"
mkdir -p "$TARGET_DIR"

cp -f cnew.sh "$TARGET_DIR/cnew"
chmod +x "$TARGET_DIR/cnew"

if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
    echo "export PATH=\"$TARGET_DIR:\$PATH\"" >> "$HOME/.bashrc"
    echo "Adding $TARGET_DIR to PATH... Restart your terminal to apply changes."
fi

echo "Done!"
read -p "Press Enter to exit..."
