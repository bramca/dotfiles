#!/bin/bash

# install packages
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update
sudo apt install brave-browser stow tmux fd-find btop ripgrep fzf lua5.4 lua5.1 liblua5.4-dev liblua5.1-dev cargo npm wezterm tldr 7zip imagemagick

# install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-
my-bash/master/tools/install.sh)"

# install go
wget https://go.dev/dl/go1.25.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.25.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install tree-sitter
cargo install --locked tree-sitter-cli

# install lazygit
go install github.com/jesseduffield/lazygit@latest

# install yazi
git clone https://github.com/sxyazi/yazi.git
cd yazi
cargo build --release --locked
sudo mv target/release/ya target/release/yazi /usr/local/bin
cd -

# install neovim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim
-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage nvim
sudo mv nvim /usr/local/bin/

# for tmux colors
tempfile=$(mktemp)
curl -o $tempfile https://raw.githubusercontent.com/wezterm/wezterm/main/termwiz/data/wezterm.terminfo
tic -x -o ~/.terminfo $tempfile
rm $tempfile

# dotfiles
git clone https://github.com/bramca/dotfiles
cd dotfiles
stow wezterm
stow nvim
stow tmux
stow yazi

# git config
git config --global user.name "bramca"
git config --global user.email "bramcautaerts@gmail.com"

# write to .shellrc file
# export GOPATH=~/go
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
# alias tms="~/.config/tmux/scripts/tmux-sessionizer"
# alias lg="lazygit"
# alias n="nvim"
# alias nh="nvim ."
# alias nf="find . | fzf | xargs nvim"
