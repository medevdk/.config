## Linux (Fedora) Sway setup ##

#### Install cli apps ####
```
sudo dnf install git tree stow vim neovim zsh tmux
```
#### and ####
```
sudo dnf install bat lolcat cowsay fortune-mod neofetch yt-dlp speedtest-cli
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

#### Install gui apps ####
```
sudo dnf install firefox zathura zathura-pdf-poppler mpv eog
```

#### clone this repo ####
```
cd ~
git clone git@github.com:medevdk/.config
```

in terminal / tty enter `sway` (or select in display manager)

- CTRL-D will open wofi (launcher)
- CTRL-ENTER will open foot (wayland terminal)
- CTRL-C will refresh sway / waybar
- CTRL-E will exit sway

Edit config files as required

## Install dotfiles ##
My dotfiles are in a seperate repo. That way availabe for MacOS too

#### clone dotfiles repo ####
```
cd ~
git clone https://github.com/medevdk/dotfiles.git
```

#### Get _zsh_ up and running (not using a plugin manager) ####

```
cd ~/dotfiles/zsh/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
```

#### Get _tmux_ up and running ####

```
cd ~/dotfiles/.tmux
git clone https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm
```

#### Symlink ####

```
cd ~/dotfiles
stow zsh
stow .tmux
stow vim
```

#### In the terminal / tty ####

```
reload

CTRL-A + Shift I
```
