#!/usr/bin/env sh

mkdir .config_save/
mv ~/.bashrc .config_save/
mv ~/.tmux .config_save/
mv ~/.tmux.conf .config_save/
mv ~/.vim .config_save/
mv ~/.vimrc .config_save/
mv ~/.vimrc .config_save/
mv ~/.config/i3 .config_save/
mv ~/.config/nitrogen .config_save/
mv ~/.config/polybar .config_save/
mv ~/.Xresources .config_save/
mv ~/.config/picom.conf .config_save/
mv ~/.mutt .config_save/
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
echo "y\ny\ny\n" | ~/.emacs.d/bin/doom install
mv ~/.doom.d .config_save/
stow */
~/.emacs.d/bin/doom sync
