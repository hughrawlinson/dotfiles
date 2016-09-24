#!/usr/bin/zsh

git pull origin master;

ln -sf $HOME/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf $HOME/.dotfiles/vim ~/.vim
ln -sf $HOME/.dotfiles/.gitconfig ~/.gitconfig
ln -sf $HOME/.dotfiles/.gitignore ~/.gitignore
ln -sf $HOME/.dotfiles/.zshrc ~/.zshrc
ln -sf $HOME/.dotfiles/.zshenv ~/.zshenv
ln -sf $HOME/.dotfiles/.spacemacs ~/.spacemacs
