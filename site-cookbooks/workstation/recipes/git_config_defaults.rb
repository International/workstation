bash "git config --global color.ui true" do
  user  node["solo_username"]
  group node["solo_username"]
end
