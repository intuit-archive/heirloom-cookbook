Vagrant.configure("2") do |config|

  # $ vagrant plugin install vagrant-berkshelf
  config.berkshelf.enabled = true

  config.vm.box      = 'cap-base-centos-6.4-v.0.1.0'
  # $ heirloom download -e lc_qa -n vagrant -i 0.1.0 -o ~/.vagrant-boxes
  config.vm.box_url  = '~/.vagrant-boxes/cap-base-centos-6.4-v0.1.0.box'
  config.vm.hostname = 'cap-base'

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "heirloom-cookbook::default"
    chef.add_recipe "minitest-handler-cookbook"
  end
end
