#!/usr/bin/bash

rm ~/.zprofile
rm ~/.vimrc
rm ~/.zshrc
rm -r ~/.config/awesome
rm -r ~/.config/ranger

ln -s ~/.dotfiles/.zprofile ~/.zprofile
ln -s ~/.dotfiles/.vimrc    ~/.vimrc
ln -s ~/.dotfiles/.zshrc    ~/.zshrc
ln -s ~/.dotfiles/.awesome  ~/.config/awesome
ln -s ~/.dotfiles/.ranger   ~/.config/ranger