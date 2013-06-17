spec_dir = File.expand_path('../../', __FILE__) + '/spec'

require 'chefspec'
require spec_dir + '/spec_helper'

describe Archive do

  let(:chef_run) {
    runner = ChefSpec::ChefRunner.new(
      :cookbook_path => 'spec/support/cookbooks',
      :step_into     => ['heirloom-cookbook_archive']
    )
    #Chef::Log.level = :debug
    runner.converge 'heirloom-tests::default'
  }
  
  it "should execute the heirloom command" do
    expect(chef_run).to execute_command('heirloom download -i v1.1.1 -n my-project -o /tmp/heirloom')
  end

end
