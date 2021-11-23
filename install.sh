#!/bin/bash

echo "info: Cloning repository"
cd /tmp
git clone https://github.com/saimonmoore/fresh_dotfiles.git dotfiles
cd dotfiles/system

echo "info: Provisioning machine"
./setup.sh

# echo "info: Installing zoxide"
# if command -v zoxide &> /dev/null
# then
#   curl -sS https://webinstall.dev/zoxide | bash
# fi

# echo "info: Sourcing nvm"
# cd ~/.nvm
# . ./nvm.sh

# echo "info: Installing ruby 2.7.x"
# eval "$(rbenv init -)"
# if ! ruby --version | grep 2.7; then
# then
#   eval "$(rbenv init -)"
#   rbenv install ruby 2.7.4
# fi

# echo "info: Setting up dotfiles via fresh"
# rm -fr ~/.freshrc && rm -fr ~/.fresh && rm -fr  ~/.dotfiles && rm -fr ~/.config/nvim
# FRESH_LOCAL_SOURCE=saimonmoore/fresh_dotfiles bash <(curl -sL get.freshshell.com)
# grep fresh ~/.bashrc || echo "source ~/.fresh/build/shell.sh" >> ~/.bashrc

# echo "info: Ensure node + ruby are installed and then install all vim plugins"
# sh -c "curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
# nvim +PlugInstall +UpdateRemotePlugins +qall --headless

# echo "info: Installation complete! Now open up a new shell and complete post-installation tasks:"

# echo "info: Install all tmux plugins"
# echo "run: In tmux, hit prefix + I to install plugins"
