#!/bin/bash

# Prompt for email
read -p "Enter your email for the SSH key: " email

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh

# Generate SSH key if it doesn't already exist
key_path=~/.ssh/id_ed25519
if [ -f "$key_path" ]; then
  echo "SSH key already exists at $key_path. Skipping key generation."
else
  ssh-keygen -t ed25519 -C "$email" -f "$key_path"
fi

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add the SSH key to the agent
ssh-add "$key_path"

# Display the public key
echo "Your public SSH key is:"
cat "$key_path.pub"

# Instructions to add the key to GitHub
echo
echo "Please copy the above SSH key and add it to your GitHub account:"
echo "  https://github.com/settings/keys"
