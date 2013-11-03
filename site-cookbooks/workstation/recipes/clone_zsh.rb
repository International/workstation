git "#{node["solo_home"]}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  action "sync"
  user node["solo_username"]
  notifies :run, "bash[setup_zshrc]"
end

bash "cp #{node["solo_home"]}/.oh-my-zsh/templates/zshrc.zsh-template #{node["solo_home"]}/.zshrc" do
  name "setup_zshrc"
  action :nothing
  user node["solo_username"]
end
