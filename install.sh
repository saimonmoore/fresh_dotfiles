#!/bin/bash

echo "info: Cloning repository"
cd /tmp
git clone https://github.com/saimonmoore/fresh_dotfiles.git dotfiles
cd dotfiles/system

echo "info: Provisioning machine"
./setup.sh

echo "info: Installing zoxide"
if command -v zoxide &> /dev/null
then
  curl -sS https://webinstall.dev/zoxide | bash
fi

echo "info: Sourcing nvm"
cd ~/.nvm
. ./nvm.sh

echo "info: Installing ruby 2.7.x"
export PATH=~/.rbenv/bin:$PATH
if ! $(ruby --version | grep '2.7');
then
  eval "$(rbenv init -)"
  rbenv install 2.7.4
fi

eval "$(rbenv init - bash)"
rbenv global 2.7.4
rbenv rehash

echo "info: Setting up dotfiles via fresh"
rm -fr ~/.freshrc && rm -fr ~/.fresh && rm -fr  ~/.dotfiles && rm -fr ~/.config/nvim && rm -fr ~/.bash_profile && rm -fr ~/.gemrc
FRESH_LOCAL_SOURCE=saimonmoore/fresh_dotfiles bash <(curl -sL get.freshshell.com)
grep fresh ~/.bashrc || echo "source ~/.fresh/build/shell.sh" >> ~/.bashrc
source ~/.fresh/build/shell.sh

echo "info: Installing nvim plugins"
sh -c "curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
/usr/local/bin/nvim +qall --headless
/usr/local/bin/nvim +UpdateRemotePlugins +qall --headless
/usr/local/bin/nvim +PlugInstall +qall --headless

echo "info: Installation complete! Now open up a new shell and complete post-installation tasks:"

echo "info: Install all tmux plugins"
echo "run: In tmux, hit prefix + I to install plugins"
