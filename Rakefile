require 'rspec/core/rake_task'
require 'chef/cookbook/metadata'

task :default => [:foodcritic, :knife, :spec]

desc "Run foodcritic"
task :foodcritic do
  sh "bundle exec foodcritic -f any ."
end

desc "Run knife test"
task :knife do
  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file('metadata.rb')
  sh "bundle exec knife cookbook test #{metadata.name} -c spec/.chef/knife.rb -o '..'"
end

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w(--color)
end
