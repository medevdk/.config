## Linux (Fedora) Sway setup ##

#### Install the required cli apps ####
```
sudo dnf install git tree stow vim neovim zsh tmux
```

#### Install Sway ####
```
sudo dnf install sway waybar wofi clipman brightnessctl mako
```

#### Install JetBrains Mono nerd font ####
```
sudo dnf copr enable maveonair/jetbrains-mono-nerd-fonts
sudo dnf install jetbrains-mono-nerd-fonts
```

#### clone the repo ####
```
cd ~
git clone git@github.com:medevdk/.config
```

in terminal / tty enter `sway` (or select in sddm)

- CTRL-D will open wofi (launcher)
- CTRL-ENTER will open foot (wayland terminal)
- CTRL-C will refresh sway / waybar
- CTRL-E will exit sway

Edit config files as required
