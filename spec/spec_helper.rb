require 'rubygems'
require 'bundler/setup'
require 'berkshelf'

# prevent recursive copies
FileUtils.rm_rf 'vendor/cookbooks'
# install deps
berksfile = Berkshelf::Berksfile.from_file('Berksfile')
berksfile.install( :path => 'vendor/cookbooks')

libs = File.expand_path("../../libraries", __FILE__)

Dir.entries(libs).each do |r|
  require "#{libs}/#{r}" unless r =~ /^\..*$/
end

RSpec.configure do |config|
  # rspec config
end
