execute "echo #{WS_USER}"
execute "echo #{node["workstation"]["git_config_defaults"]["git_config_owner_user"]}"

# execute "git config --global color.ui true" do
#   user 
# end
