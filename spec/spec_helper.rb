require 'rubygems'
require 'bundler/setup'
require 'berkshelf'

# install deps
# prevent recursive vendoring by berkshelf
# https://github.com/RiotGames/berkshelf/issues/263
FileUtils.rm_rf 'spec/sandbox'
berksfile = Berkshelf::Berksfile.from_file('Berksfile')
berksfile.install(
  :path => 'spec/sandbox',
  :only => :test
)

libs = File.expand_path("../../libraries", __FILE__)
Dir.entries(libs).each do |r|
  require "#{libs}/#{r}" unless r =~ /^\..*$/
end

RSpec.configure do |config|
  # rspec config
end
