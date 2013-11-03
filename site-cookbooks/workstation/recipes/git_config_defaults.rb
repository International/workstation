["color.ui true", 
 "user.name '#{node["solo_git_name"]}'", 
 "user.email '#{node["solo_git_email"]}"].each do |git_cmd|
   execute "command #{git_cmd}" do
     command "git config --global #{git_cmd}"
     user node["solo_username"]
   end
end
