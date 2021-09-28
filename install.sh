#!/bin/bash

echo "info: Cloning repository"
cd /tmp
git clone git@github.com:saimonmoore/fresh_dotfiles.git dotfiles
cd dotfiles/system

echo "info: Provisioning machine"
./setup.sh

echo "info: Installing nvm"
rm -fr ~/.nvm
git clone https://github.com/nvm-sh/nvm.git ~/.nvm
cd ~/.nvm && git checkout v0.38.0
. ./nvm.sh
cd -

echo "info: Installing rbenv"
if [ ! -d "$HOME/.rbenv" ]
then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
fi

echo "info: Setting up dotfiles via fresh"
rm -fr ~/.freshrc && rm -fr ~/.fresh && rm -fr  ~/.dotfiles && rm -fr ~/.config/nvim
FRESH_LOCAL_SOURCE=saimonmoore/fresh_dotfiles bash <(curl -sL get.freshshell.com)
grep fresh ~/.bashrc || echo "source ~/.fresh/build/shell.sh" >> ~/.bashrc

echo "info: Installation complete! Now open up a new shell and complete post-installation tasks:"

echo "info: Install node:"
echo "nvm install node"
echo "nvm use node"
echo "info: Install yarn:"
echo "npm install -g yarn"

echo "info: Install ruby:"
echo "rbenv install 2.7.1"

echo "info: Install all tmux plugins"
echo "run: In tmux, hit prefix + I to install plugins"

echo "info: Ensure node + ruby are installed and then install all vim plugins"
sh -c "curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo "run: In nvim, hit :PluginInstall and :UpdateRemotePlugins to install plugins"
