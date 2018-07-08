#!/usr/bin/bash

cd ~
rm .zprofile
rm .vimrc
rm .zshrc
rm -r .config

ln -s .dotfiles/.zprofile .zprofile
ln -s .dotfiles/.vimrc  .vimrc
ln -s .dotfiles/.zshrc  .zshrc
ln -s .dotfiles/.config .config
