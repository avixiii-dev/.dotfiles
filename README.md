# My Dotfiles

This repository contains my personal dotfiles for:
- Alacritty - A fast, cross-platform terminal emulator
- Fish Shell - A smart and user-friendly command line shell
- Neovim - Hyperextensible Vim-based text editor
- iTerm2 - A terminal emulator for macOS

## Prerequisites

- macOS
- Git
- Internet connection (for downloading packages)

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
- Create necessary symbolic links
- Install required packages via Homebrew
- Configure Fish as your default shell
- Set up your development environment

## Components

### Alacritty
- Modern terminal emulator
- GPU-accelerated rendering
- Configuration files in `alacritty/`

### Fish Shell
- User-friendly shell with great defaults
- Syntax highlighting and autosuggestions
- Configuration files in `fish/`

### Neovim
- Modern text editor based on Vim
- Custom configurations and plugins
- Configuration files in `nvim/`

### iTerm2
- Feature-rich terminal emulator for macOS
- Custom color schemes and preferences
- Configuration files in `iterm2/`

## Post Installation

After installation:
1. Restart your terminal
2. Fish shell will be set as your default shell
3. All configurations will be automatically loaded

## Customization

Feel free to fork this repository and modify any configurations to match your preferences:
- Alacritty config: `~/.config/alacritty/`
- Fish config: `~/.config/fish/`
- Neovim config: `~/.config/nvim/`
- iTerm2 preferences will be in `~/Library/Preferences/`

## License

This project is open source and available under the MIT License.
