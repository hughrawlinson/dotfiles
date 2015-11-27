#!/usr/bin/zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
#rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;

ln -sf $HOME/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf $HOME/.dotfiles/.vimrc ~/.vimrc
ln -sf $HOME/.dotfiles/.zshrc ~/.zshrc
ln -sf $HOME/.dotfiles/.vim ~/.vim
ln -sf $HOME/.dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -sf $HOME/.dotflies/.tmuxinator ~/.tmuxinator
