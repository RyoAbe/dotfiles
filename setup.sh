#!/bin/sh

# prepare
echo "========================="
echo "1. rm exist files"
echo "========================="
rm -rf ~/.oh-my-zsh
rm -rf ~/.vim
rm -rf ~/.vimswp
rm -rf ~/.vimbk
rm ~/.vimrc 2> /dev/null
rm ~/.zshrc 2> /dev/null
rm ~/.gitconfig 2> /dev/null
rm ~/.gitignore_global 2> /dev/null

# oh-my-zsh
echo "========================="
echo "2. install oh-my-zsh"
echo "========================="
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -p ~/.dotfiles/ryoabe.zsh-theme ~/.oh-my-zsh/themes/ryoabe.zsh-theme

# Dotfiles
echo "========================="
echo "3. make synblic link"
echo "========================="
mkdir ~/.vim
mkdir ~/.vimswp
mkdir ~/.vimbk
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global

# フォルダ
# echo "make folder"
# mkdir ~/Temporary
# mkdir ~/Work

# Alfred
# [Preferences] -> [Advanced] -> [Set Folder...]
# ~/Dropbox/Private/SettingFiles/Alfred