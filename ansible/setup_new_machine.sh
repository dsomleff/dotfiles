#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install Ansible
echo "Installing Ansible..."
brew install ansible

# Run your Ansible playbook (now called `setup_new_machine.yml`)
echo "Running Ansible playbook..."
ansible-playbook setup_new_machine.yml

