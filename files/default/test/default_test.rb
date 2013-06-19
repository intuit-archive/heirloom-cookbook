require 'minitest/spec'

describe_recipe "heirloom" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it 'should install the heirloom package' do
    package("heirloom").must_be_installed
  end

end

