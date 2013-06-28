spec_dir = File.expand_path('../../', __FILE__) + '/spec'

require 'chefspec'
require spec_dir + '/spec_helper'

describe Archive do

  context "LWRP" do
    let(:chef_run) {
      runner = ChefSpec::ChefRunner.new(
        :cookbook_path => 'spec/support/cookbooks',
        :step_into     => ['heirloom_archive']
      )
      runner.converge 'heirloom-tests::default'
    }
    
    it "should execute the heirloom command" do
      expect(chef_run).to execute_command('heirloom download -i v1.1.1 -n my-project -o /tmp/heirloom')
    end
  end

  context "package install" do
    let(:chef_run) {
      runner = ChefSpec::ChefRunner.new
      runner.node.set['heirloom']['version'] = 'v1.2.3'
      runner.converge 'heirloom'
    }

    it "should install a specific version of the heirloom rpm package" do
      expect(chef_run).to install_package_at_version 'heirloom', 'v1.2.3'
    end
  end

end
