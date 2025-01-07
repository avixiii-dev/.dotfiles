#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default installation directory
CONFIG_DIR="$HOME/.config"

echo -e "${BLUE}Starting installation...${NC}"

# Check and install Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${BLUE}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo -e "${GREEN}Homebrew is already installed${NC}"
fi

# Function to check and install packages
install_if_missing() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${BLUE}Installing $1...${NC}"
        brew install $1
        echo -e "${GREEN}$1 installed successfully${NC}"
    else
        echo -e "${GREEN}$1 is already installed${NC}"
    fi
}

# Install required packages
echo -e "${BLUE}Checking required packages...${NC}"
install_if_missing "alacritty"
install_if_missing "nvim"

# Special handling for Fish shell
if ! command -v fish &> /dev/null; then
    echo -e "${BLUE}Installing Fish shell...${NC}"
    brew install fish
    
    # Add Fish to /etc/shells if not already added
    if ! grep -q "$(which fish)" /etc/shells; then
        echo "$(which fish)" | sudo tee -a /etc/shells
    fi
    
    # Set Fish as default shell
    echo -e "${BLUE}Setting Fish as default shell...${NC}"
    chsh -s "$(which fish)"
else
    echo -e "${GREEN}Fish shell is already installed${NC}"
fi

# Create config directory if it doesn't exist
echo -e "${BLUE}Setting up configuration files...${NC}"
mkdir -p "$CONFIG_DIR"

# Copy all items to .config
echo -e "${GREEN}Moving all configurations to $CONFIG_DIR...${NC}"
cp -r ./* "$CONFIG_DIR/"

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${BLUE}All configurations have been moved to: $CONFIG_DIR${NC}"
echo -e "${BLUE}Please restart your terminal to apply all changes.${NC}"
