#!/bin/bash

echo "Configuration to install: ${1}"

# update system and install curl
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl

# install chef\
curl -L https://omnitruck.chef.io/install.sh | sudo bash

# create solo.rb
cat > solo.rb <<_EOF_
solo true
chef_license 'accept'
_EOF_

sudo chef-solo -c solo.rb -j "https://f001.backblazeb2.com/file/home-kitchen/${1}.json" --recipe-url "https://f001.backblazeb2.com/file/home-kitchen/cookbooks.tar.gz"
