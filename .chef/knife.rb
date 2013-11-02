### Chef Server
#
# KNIFE_CHEF_SERVER             - the URL for the Chef Server
# KNIFE_VALIDATION_CLIENT_NAME  - validation client name, default is
#                                 'chef-validator'
#
chef_dir    = "#{ENV['HOME'] || ENV['HOMEDRIVE']}/.chef"
current_dir = File.dirname(__FILE__)

# chef server location and validation key
chef_server_url           ENV['KNIFE_CHEF_SERVER_URL']
validation_client_name    ENV['KNIFE_VALIDATION_CLIENT_NAME'] ||
                          'chef-validator'
validation_key            ENV['KNIFE_VALIDATION_KEY'] ||
                          "#{chef_dir}/validation.pem"

# user/client name and key
node_name                 (ENV['KNIFE_USER'] || ENV['USER'] ||
                           ENV['USERNAME']).downcase
client_key                ENV['KNIFE_CLIENT_KEY'] ||
                          "#{chef_dir}/#{node_name}.pem"

# path to cookbooks
cookbook_path             ["#{File.dirname(__FILE__)}/../cookbooks"]

# logging details
log_level                 :info
log_location              STDOUT

# caching options
cache_type                'BasicFile'
cache_options( :path =>   "#{chef_dir}/checksums" )

file_backup_path          "#{chef_dir}/backups"

# new cookbook defaults
cookbook_copyright        ENV['KNIFE_COOKBOOK_COPYRIGHT'] ||
                          %x{git config --get user.name}.chomp
cookbook_email            ENV['KNIFE_COOKBOOK_EMAIL'] ||
                          %x{git config --get user.email}.chomp
cookbook_license          'apachev2'

# allow overriding values in this knife.rb
if ENV['KNIFE_OVERRIDE'] && File.exist?(ENV['KNIFE_OVERRIDE'])
  Chef::Config.from_file(ENV['KNIFE_OVERRIDE'])
end
