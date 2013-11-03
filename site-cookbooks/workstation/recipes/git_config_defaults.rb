execute "setting color.ui true" do
  command "git config --global color.ui true"
  user  node["solo_username"]
end
