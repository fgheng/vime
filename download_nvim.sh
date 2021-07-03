#!/bin/sh

if [ ! -f "/usr/local/bin/nvim" ];then
	sudo apt install cmake automake libtool libtool-bin gperf luajit luarocks libuv1-dev libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev libvterm-dev libutf8proc-dev -y
	git clone https://github.com/neovim/neovim.git neovim
	cd neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
fi
git clone https://github.com/fgheng/vime ~/.config/nvim
git clone https://github.com/srcery-colors/srcery-vim.git
mkdir -p ~/.config/nvim/colors
cp ./srcery-vim/colors/srcery.vim ~/.config/nvim/colors/

if [ ! -f "/usr/bin/node" ];then
##install nodejs
#sudo apt install nodejs -y
sudo apt -y upgrade
sudo apt update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt install nodejs -y
fi

python3 -m pip install --user --upgrade pynvim

python -m pip install --user --upgrade pynvim


