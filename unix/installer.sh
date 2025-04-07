#!/bin/bash

TARGET_DIR="$HOME/bin"
mkdir -p "$TARGET_DIR"

cp -f cnew.sh "$TARGET_DIR/cnew"
chmod +x "$TARGET_DIR/cnew"

# For Zsh
if [[ "$SHELL" == */zsh ]]; then
    SHELL_RC="$HOME/.zshrc"
    echo "export PATH=\"$TARGET_DIR:\$PATH\"" >> "$SHELL_RC"
    echo "➕ Added $TARGET_DIR to PATH in ~/.zshrc"

# For Bash
elif [[ "$SHELL" == */bash ]]; then
    SHELL_RC="$HOME/.bashrc"
    echo "export PATH=\"$TARGET_DIR:\$PATH\"" >> "$SHELL_RC"
    echo "➕ Added $TARGET_DIR to PATH in ~/.bashrc"

# For Fish
elif [[ "$SHELL" == */fish ]]; then
    SHELL_RC="$HOME/.config/fish/config.fish"
    echo "set -gx PATH \"$TARGET_DIR \$PATH\"" >> "$SHELL_RC"
    echo "➕ Added $TARGET_DIR to PATH in ~/.config/fish/config.fish"

else
    echo "⚠️ Unsupported shell. No PATH modification made."
fi

echo "✅ Done! You can now use 'cnew' from any terminal."
echo "⚠️ Restart your terminal in order to use `cnew`"

read -p "Press Enter to exit..."