git "#{node["solo_home"]}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  action "sync"
  owner node["solo_username"]
end