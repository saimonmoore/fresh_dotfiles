#!/usr/bin/env bash

function install_ansible() {
  sudo apt update
  sudo apt -y install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt -y install ansible
}

function install_ansible_plugins() {
  ansible-galaxy collection install --force community.general
}

which ansible-playbook > /dev/null

if [ "$?" != "0" ]; then
  install_ansible
fi

install_ansible_plugins

# provision machine
ansible-playbook -i "localhost," -c local -u saimon --become-method=su playbook.yml
