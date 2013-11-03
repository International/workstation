execute "setting color.ui true" do
  command "git config --global color.ui true"
  user  node["solo_username"]
end

execute "configure username" do
  command "git config --global user.name #{node["solo_git_name"]}"
  user node["solo_username"]
end

execute "configure email" do
  command "git config --global user.email #{node["solo_git_email"]}"
  user node["solo_username"]
end
