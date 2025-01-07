# My Dotfiles

This repository contains my personal dotfiles for:
- Alacritty - A fast, cross-platform terminal emulator
- Fish Shell - A smart and user-friendly command line shell
- Neovim - Hyperextensible Vim-based text editor
- Git - Version control system configuration

## Prerequisites

Before installation, make sure you have these installed:
- macOS
- Git
- [Homebrew](https://brew.sh)
- Fish shell (`brew install fish`)
- Alacritty (`brew install alacritty`)
- Neovim (`brew install neovim`)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/avixiii/dotfiles.git
cd dotfiles
```

2. Run the install script:
```bash
chmod +x install.sh
./install.sh
```

The install script will:
- Move all configurations to `~/.config`
- Set up Git global configuration
- Configure Fish as your default shell
- Handle existing shell configurations (zsh)

## Components

### Fish Shell
- Smart and user-friendly command line shell
- Custom aliases and functions
- Git abbreviations
- Integration with:
  - Homebrew
  - Node Version Manager
  - Starship prompt (if installed)
  - fzf for history search

### Git Configuration
- Global gitignore
- Useful aliases and defaults
- Enhanced diff and merge tools
- Custom color settings

### Alacritty
- Modern terminal emulator
- GPU-accelerated rendering
- Custom key bindings and colors

### Neovim
- Modern text editor based on Vim
- Custom configurations and plugins
- Configured as default Git editor

## Post Installation

After installation:
1. Restart your terminal
2. Fish shell will be set as your default shell
3. All configurations will be automatically loaded
4. If terminal opens in zsh, it will automatically switch to fish

## Customization

Feel free to modify any configuration files to match your preferences:
- Alacritty config: `~/.config/alacritty/`
- Fish config: `~/.config/fish/`
- Neovim config: `~/.config/nvim/`
- Git config: `~/.gitconfig` and `~/.gitignore_global`

## License

This project is open source and available under the MIT License.
