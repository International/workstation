# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "u13"
  config.vm.provision :shell, :path => "provisioner.sh", :privileged => false

  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "cookbooks"
  #   chef.roles_path = "roles"
  #   chef.data_bags_path = "data_bags"

  #   chef.json = { :mysql_password => "foo" }
  # end

end
