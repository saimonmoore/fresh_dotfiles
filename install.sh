#!/bin/bash

echo "info: Cloning repository"
cd /tmp
git clone git@github.com:saimonmoore/fresh_dotfiles.git dotfiles
cd dotfiles/system

echo "info: Provisioning machine"
./setup.sh

echo "info: Setting up dotfiles via fresh"
FRESH_LOCAL_SOURCE=saimonmoore/fresh_dotfiles bash <(curl -sL get.freshshell.com)

