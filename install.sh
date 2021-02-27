#!/bin/bash

echo "info: Cloning repository"
cd /tmp
git clone git@github.com:saimonmoore/fresh_dotfiles.git dotfiles
cd dotfiles/system

echo "info: Provisioning machine"
./setup.sh

echo "info: Setting up dotfiles via fresh"
FRESH_LOCAL_SOURCE=saimonmoore/fresh_dotfiles bash <(curl -sL get.freshshell.com)

echo "info: Setting up TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

grep fresh ~/.bashrc || echo "source ~/.fresh/build/shell.sh" >> ~/.bashrc

echo "info: Installation complete! Now open up a new shell and complete post-installation tasks:"

echo "info: Install all tmux plugins"
echo "run: In tmux, hit prefix + I to install plugins"

echo "info: Install all vim plugins"
sh -c "curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo "run: In nvim, hit :PluginInstall and :UpdateRemotePlugins to install plugins"


