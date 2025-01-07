#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default installation directory
CONFIG_DIR="$HOME/.config"

echo -e "${BLUE}Starting installation...${NC}"

# Create config directory if it doesn't exist
echo -e "${BLUE}Setting up configuration files...${NC}"
mkdir -p "$CONFIG_DIR"

# Copy all items to .config
echo -e "${GREEN}Moving all configurations to $CONFIG_DIR...${NC}"
cp -r ./* "$CONFIG_DIR/"

# Git configuration
echo -e "${BLUE}Setting up Git configuration...${NC}"
if [ -f "$CONFIG_DIR/git/.gitconfig" ]; then
    ln -sf "$CONFIG_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi
if [ -f "$CONFIG_DIR/git/.gitignore_global" ]; then
    ln -sf "$CONFIG_DIR/git/.gitignore_global" "$HOME/.gitignore_global"
fi

# Set Fish as default shell
if command -v fish &> /dev/null; then
    echo -e "${BLUE}Setting up Fish as default shell...${NC}"
    
    # Remove existing shell configurations
    rm -f "$HOME/.zshrc"
    rm -rf "$HOME/.oh-my-zsh"
    
    # Add Fish to /etc/shells if not already added
    if ! grep -q "$(which fish)" /etc/shells; then
        echo "$(which fish)" | sudo tee -a /etc/shells
    fi
    
    # Change default shell to Fish
    chsh -s "$(which fish)"
    
    # Create a simple .zshrc that automatically switches to fish
    echo 'exec fish' > "$HOME/.zshrc"
    
    echo -e "${GREEN}Fish shell is now your default shell${NC}"
else
    echo -e "${RED}Fish shell is not installed. Please install it first with: brew install fish${NC}"
fi

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${BLUE}All configurations have been moved to: $CONFIG_DIR${NC}"
echo -e "${BLUE}Please restart your terminal to apply all changes.${NC}"
