#!/bin/bash

set -x
set -e

sudo apt-get install -y ruby1.9.1-dev git-core

pushd `pwd`

if rvm --version 2>/dev/null; then
  gem install soloist -v 1.0.0.pre --no-ri --no-rdoc
  gem install librarian-chef -v 0.0.2 --no-ri --no-rdoc
else
  sudo gem install librarian-chef -v 0.0.2 --no-ri --no-rdoc
  sudo gem install soloist -v 1.0.0.pre --no-ri --no-rdoc
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- workstation::ack
EOF

repo_directory=workstation
repo_url=https://github.com/International/workstation.git

if [[ -d $repo_directory ]]; then
  cd $repo_directory && git pull && cd ..
else
  git clone $repo_url
fi

soloist
popd
