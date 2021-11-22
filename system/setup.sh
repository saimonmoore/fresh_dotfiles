#!/usr/bin/env bash

function install_ansible() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
    sudo apt -y install software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt -y install ansible
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install ansible
  fi
}

function install_ansible_plugins() {
  ansible-galaxy collection install community.general
  ansible-galaxy install markosamuli.asdf
  ansible-galaxy install darkwizard242.googlechrome
  ansible-galaxy install lean_delivery.mysql
  ansible-galaxy install robertdebock.postgres
}

which ansible-playbook > /dev/null

if [ "$?" != "0" ]; then
  install_ansible
fi

install_ansible_plugins

# provision machine
ansible-playbook -i "localhost," -c local -u saimon --become-method=su playbook.yml
