#!/usr/bin/zsh

git pull origin master;

rsync --exclude-from "./.rsyncignore" -avh --no-perms . ~;

# ln -sf $HOME/.dotfiles/.tmux.conf ~/.tmux.conf
# ln -sf $HOME/.dotfiles/.vimrc ~/.vimrc
# ln -sf $HOME/.dotfiles/.zshrc ~/.zshrc
# ln -sf $HOME/.dotfiles/.vim ~/.vim
# ln -sf $HOME/.dotfiles/.oh-my-zsh ~/.oh-my-zsh
# ln -sf $HOME/.dotfiles/.spacemacs ~/.spacemacs
