#!/usr/bin/env bash

function install_ansible() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
    sudo apt install software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install ansible
  fi
}

function install_ansible_plugins() {
  ansible-galaxy collection install community.general
  ansible-galaxy install cimon-io.asdf
  ansible-galaxy install darkwizard242.googlechrome
}

which ansible-playbook > /dev/null

if [ "$?" != "0" ]; then
  install_ansible
  install_ansible_plugins
fi

# provision machine
sudo ansible-playbook -i "localhost," -c local --become-method=su playbook.yml
