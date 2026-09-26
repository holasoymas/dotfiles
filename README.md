# My Dotfiles

A comprehensive bspwm-based desktop environment setup with a modern, clean aesthetic featuring Gruvbox-inspired colors and efficient tiling window management.

## 🖥️ Environment Overview

This dotfiles configuration provides a complete desktop experience with:

- **Window Manager**: bspwm (tiling window manager)
- **Terminal**: Alacritty (fast, cross-platform terminal)
- **App Launcher**: Rofi (application launcher/dmenu replacement)
- **Status Bar**: Polybar (customizable status bar)
- **Keyboard Shortcuts**: sxhkd (hotkey daemon)
- **Theme**: Gruvbox-inspired dark color scheme
- **Fonts**: Nerd Fonts (Hack and JetBrains Mono)

## 📦 Installation Guide

### Prerequisites

Before installation, ensure you have the following basic tools:

```bash
# For Debian/Ubuntu
sudo apt update && sudo apt install -y git stow

# For Arch Linux
sudo pacman -Syu git stow

# For Fedora
sudo dnf install git stow
```

### Package Installation

#### Debian/Ubuntu

```bash
# System packages
sudo apt update && sudo apt install -y \
    bspwm \
    sxhkd \
    polybar \
    rofi \
    alacritty \
    xinput \
    brightnessctl \
    pavucontrol \
    xfce4-screenshooter \
    feh \
    redshift

# Add user to video group for brightness control
sudo usermod -aG video $USER
newgrp video
```

#### Arch Linux

```bash
# System packages
sudo pacman -Syu \
    bspwm \
    sxhkd \
    polybar \
    rofi \
    alacritty \
    xorg-xinput \
    brightnessctl \
    pavucontrol \
    xfce4-screenshooter \
    feh \
    redshift 

# Add user to video group for brightness control
sudo usermod -aG video $USER
newgrp video
```

#### Fedora

```bash
# System packages
sudo dnf install \
    bspwm \
    sxhkd \
    polybar \
    rofi \
    alacritty \
    xinput \
    brightnessctl \
    pavucontrol \
    xfce4-screenshooter \
    feh \
    redshift 

# Add user to video group for brightness control
sudo usermod -aG video $USER
newgrp video
```

### Font Installation

The Nerd fonts are already included in the `fonts/` directory. Install them by:

```bash
# Copy fonts to system font directory
mkdir -p ~/.local/share/fonts
cp fonts/*.ttf ~/.local/share/fonts/

# Update font cache
fc-cache -fv
```

## 🚀 Setup Instructions

### 1. Clone and Setup Dotfiles

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles

# Create assets directory for wallpapers and media
mkdir -p assets

# Install configurations using stow
stow bspwm
stow sxhkd
stow polybar
stow rofi
stow alacritty
```

### 2. Configure Display Manager

Ensure your display manager is set up to start Xorg with the bspwm session:

```bash
# For LightDM (Ubuntu/Debian)
echo "[Desktop Entry]
Name=BSPWM
Comment=BSPWM session
Exec=startx /usr/bin/bspwm
TryExec=/usr/bin/bspwm
Type=Application
DesktopNames=BSPWM" | sudo tee /usr/share/xsessions/bspwm.desktop
```

### 3. Wallpaper Setup

Place your wallpapers in the `assets/` directory. The configuration currently uses `~/.fehbg` for wallpaper management.

```bash
# Set wallpaper (example)
feh --bg-scale assets/wallpaper.jpg
```

## ⌨️ Keyboard Shortcuts

### Window Management
- **Super + Return**: Open Alacritty terminal
- **Super + Space**: Open Rofi app launcher
- **Super + f**: Toggle fullscreen
- **Super + e**: Toggle monocle mode
- **Super + h/j/k/l**: Focus window (left/down/up/right)
- **Super + q**: Close current window
- **Super + d**: Toggle show desktop
- **Super + 1-5**: Switch desktops
- **Super + Shift + q**: Quit session

### System Controls
- **XF86MonBrightnessUp/Down**: Adjust screen brightness
- **XF86AudioRaiseVolume/LowerVolume**: Adjust volume
- **XF86AudioMute**: Toggle mute
- **Print**: Full screenshot
- **Shift + Print**: Regional screenshot
- **Alt + Print**: Window screenshot
- **Super + Escape**: Restart sxhkd

## 🔧 Configuration Files

### bspwm (`config/bspwm/`)
- `bspwmrc`: Main bspwm configuration
- `powermenu.sh`: Power menu script

### sxhkd (`config/sxhkd/`)
- `sxhkdrc`: Keyboard shortcuts configuration

### Polybar (`config/polybar/`)
- `config.ini`: Status bar configuration with modules for:
  - System logo
  - Workspace indicators
  - Date/time
  - WiFi status
  - CPU/memory usage
  - Battery status
  - Audio controls
  - Power menu

### Rofi (`config/rofi/`)
- `config.rasi`: Application launcher styling

### Alacritty (`config/alacritty/`)
- `alacritty.toml`: Terminal configuration with Gruvbox colors

## 📁 Directory Structure

```
dotfiles/
├── config/
│   ├── bspwm/
│   │   ├── bspwmrc
│   │   └── powermenu.sh
│   ├── sxhkd/
│   │   └── sxhkdrc
│   ├── polybar/
│   │   └── config.ini
│   ├── rofi/
│   │   └── config.rasi
│   └── alacritty/
│       └── alacritty.toml
├── fonts/
│   ├── HackNerdFont-*.ttf
│   ├── JetBrainsMonoNerdFont-*.ttf
│   └── SymbolsNerdFont-*.ttf
├── assets/           # For wallpapers and media
└── README.md
```

## 🔄 Maintenance

### Updating Configuration

```bash
# Pull latest changes
git pull origin main

# Reinstall configurations
stow -R bspwm sxhkd polybar rofi alacritty
```

### Adding New Applications

1. Add application to appropriate package lists
2. Create configuration file in `config/` directory
3. Use `stow` to symlink the configuration
4. Update keyboard shortcuts in `sxhkdrc` if needed

## 📸 Screenshots

*Note: Screenshots will be added to the `assets/` directory soon*

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Note**: This setup is designed for X11-based Linux distributions. Some components may need adjustments for Wayland compatibility.
