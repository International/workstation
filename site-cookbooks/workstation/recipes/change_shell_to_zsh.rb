include_recipe "zsh"

user node["solo_username"] do
  shell "/bin/zsh"
end
