mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "zawad@devsnest.llc"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo "Please add the given credentials to https://github.com/settings/keys"
