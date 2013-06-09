Vagrant.configure("2") do |config|

  # $ vagrant plugin install vagrant-berkshelf
  config.berkshelf.enabled = true

  config.vm.box      = 'cap-base-centos-6.4'
  config.vm.box_url  = '/Users/dvaughn1/src/base-box/cap-base-centos-6.4.box'
  config.vm.hostname = 'cap-base'

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "heirloom-cookbook::default"
  end
end
