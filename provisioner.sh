#!/bin/bash

set -x
set -e

sudo apt-get install -y ruby1.9.1-dev git-core

pushd `pwd`

if rvm --version 2>/dev/null; then
  gem install soloist -v 1.0.0.pre --no-ri --no-rdoc
  gem install librarian-chef --no-ri --no-rdoc
else
  sudo gem install librarian-chef --no-ri --no-rdoc
  sudo gem install soloist -v 1.0.0.pre --no-ri --no-rdoc
fi

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::ack
EOF
if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi

soloist
popd
