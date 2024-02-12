#!/bin/bash

initial_path=$(pwd)
script_dir=$(dirname "$(realpath "$0")")

cd

# Update
sudo apt update -y
sudo apt upgrade -y

# apt packages and dependencies for other programs
sudo apt install -y git curl tmux fzf ncdu stow python3 python3-pip clang-format gcc cmake ninja-build gettext unzip fzf libappindicator1 clangd-12 clang

# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# latest clang
wget https://apt.llvm.org/llvm.sh
chmod u+x llvm.sh
sudo ./llvm.sh
rm llvm.sh

# Rust packages
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source .cargo/env
cargo install fd-find
cargo install ripgrep
cargo install bat
cargo install exa

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -r lazygit.tar.gz lazigit/

if [ ! -d repos ]; then
    mkdir repos
fi
cd repos/

if [ -d neovim ]; then
    echo -n "The repos/neovim/ directory already exists. Do you want to remove it to install neovim? (y/n)"
    read answer

    if [[ "$answer" = "y" ]]; then
        rm -rf neovim/
        git clone https://github.com/neovim/neovim.git
        cd neovim/
        git checkout stable
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
        cd ..
        # Install lsps and formatters too
        python3 -m pip install pyright balck
        # Lua
        cd
        git clone https://github.com/LuaLS/lua-language-server .lua-language-server
        cd .lua-language-server
        ./make.sh
        cd ..
    else
        echo "Neovim will not be installed"
    fi
fi

cd

# Wezterm (https://wezfurlong.org/wezterm/install/linux.html)
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update -y
sudo apt install -y wezterm

# Fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update -y
sudo apt install -y fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
chsh $(whoami) -s /usr/bin/fish

# Python packages
python3 -m pip install --no-input jupyter matplotlib numpy scipy neovim qmk

# Deps for qtile
pip install xcffib
pip install qtile
sudo cp ${script_dir}/aux_files/qtile.desktop /usr/share/xsessions/

### Rofi
# dependencies
sudo apt install -y bison check flex libcairo2-dev libgdk-pixbuf-2.0-dev libglib2.0-dev libpango1.0-dev libpangocairo-1.0-0 libstartup-notification0-dev libxcb-cursor-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util-dev libxcb-xinerama0-dev libxcb1-dev libxkbcommon-dev libxkbcommon-x11-dev

# rofi custom version
wget https://github.com/davatorium/rofi/releases/download/1.7.4/rofi-1.7.4.tar.gz
tar xvf rofi-1.7.4.tar.gz
cd rofi-1.7.4
mkdir build
cd build
../configure
make
sudo make install
cd ../../
rm -rf rofi-1.7.4

# nice launchers
git clone https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ../
rm -rf rofi

# QMK
qmk setup --yes

# Fonts
cd

mkdir -p ${HOME}/.local/share/fonts/

# Hack
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
unzip Hack.zip -d hack_font/
mv hack_font/*ttf ${HOME}/.local/share/fonts/
rm -rf hack_font/ Hack.zip

# Symbols
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip -d NerdFontsSymbolsOnly
mv NerdFontsSymbolsOnly/*ttf ${HOME}/.local/share/fonts/
rm -rf NerdFontsSymbolsOnly.zip NerdFontsSymbolsOnly/

# Chrome
wget wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# MEGA sync
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb
sudo apt install "$PWD/megasync-xUbuntu_22.04_amd64.deb"
rm "$PWD/megasync-xUbuntu_22.04_amd64.deb"

cd $initial_path
