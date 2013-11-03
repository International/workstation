git "#{node["solo_home"]}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  action "sync"
  user node["solo_username"]
  notifies :run, "bash[setup_zshrc]"
end

bash "setup_zshrc" do
  command "cp -f #{node["solo_home"]}/.oh-my-zsh/templates/zshrc.zsh-template #{node["solo_home"]}/.zshrc"
  action :nothing
end
