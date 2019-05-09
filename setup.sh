#!/usr/bin/bash

#TODO: add options for what system this is going on ie putty awesome

rm    ~/.zprofile
rm    ~/.vimrc
rm    ~/.zshrc
rm    ~/.tmux.conf
rm -r ~/.config/awesome
rm -r ~/.config/ranger

ln -s ~/.dotfiles/.zprofile  ~/.zprofile
ln -s ~/.dotfiles/.vimrc     ~/.vimrc
ln -s ~/.dotfiles/.zshrc     ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.awesome   ~/.config/awesome
ln -s ~/.dotfiles/.ranger    ~/.config/ranger
