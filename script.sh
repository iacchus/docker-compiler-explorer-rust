#!/usr/bin/env bash

GIT_STUFF="$HOME/git-stuff"

ROOT_USER='root'
ROOT_USER_HOME_DIR='/root'

# UPDATE PACMAN'S PACKAGE DATABASES
pacman -Syu --noconfirm
pacman -Fy

# SET LOCALE
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf        
locale-gen

pacman --noconfirm -S \
    fd \
    git \
    make \
    neovim \
    nodejs-lts-erbium \
    npm6 \
    ripgrep \
    which

#hash -r

git clone https://github.com/compiler-explorer/compiler-explorer.git compiler-explorer

#cd compiler-explorer

echo "done."
