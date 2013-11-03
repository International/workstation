#!/bin/bash

set -x
set -e

sudo apt-get install -y ruby1.9.1-dev git-core

repo_directory=workstation
repo_url=https://github.com/International/workstation.git
branch=recipes
soloist_version=0.9.7

pushd `pwd`

if hash soloist 2>/dev/null; then
  echo "Already installed soloist"
else
  echo "No soloist installed"

  if rvm --version 2>/dev/null; then
    gem install soloist -v $soloist_version --no-ri --no-rdoc
  else
    sudo gem install soloist -v $soloist_version --no-ri --no-rdoc
  fi
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD/$repo_directory/site-cookbooks
- $PWD/$repo_directory/cookbooks
recipes:
- runit
- workstation::ack
- redisio
- redisio::install
- memcached
- workstation::git_config_defaults
- workstation::vlc

node_attributes:
  solo_username: vagrant
  solo_git_name: "George Opritescu"
  solo_git_email: ssscripting@gmail.com
EOF

if [[ -d $repo_directory ]]; then
  cd $repo_directory && git pull && cd ..
else
  git clone $repo_url $repo_directory
  pushd $repo_directory
  git checkout --track origin/$branch
  popd
fi

soloist
popd
