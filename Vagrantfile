Vagrant.configure("2") do |config|

  # $ vagrant plugin install vagrant-berkshelf
  config.berkshelf.enabled = true
  
  # $ vagrant plugin install vagrant-omnibus
  config.omnibus.chef_version = "10.16.2"

  config.vm.box      = 'opscode-centos-6.4'
  config.vm.box_url  = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box'
  config.vm.hostname = 'cap-vagrant'

  config.vm.provision :shell do |shell|
    shell.inline = %q{
cat > /etc/yum.repos.d/intu-packages-us-east-1.repo << EOS
[intu-packages-us-east-1]
name=Intuit Custom RPM Packages
baseurl=http://s3.amazonaws.com/intu-packages-us-east-1/rhel/6/x86_64
gpgcheck=0
enabled=1
EOS
}
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "heirloom"
    chef.add_recipe "minitest-handler-cookbook"
  end
end
