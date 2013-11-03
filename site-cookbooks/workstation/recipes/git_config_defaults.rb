execute "git config --global color.ui true" do
  user  node["solo_username"]
  group node["solo_username"]
end

execute "git config --global user.name #{node["solo_git_name"]} user.email #{node["solo_git_email"]}" do
  user  node["solo_username"]
  group node["solo_username"]
end
