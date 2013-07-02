require 'foodcritic'
require 'rspec/core/rake_task'

task :default => [:foodcritic, :knife, :spec]

desc "Run foodcritic"
FoodCritic::Rake::LintTask.new do |t|
  t.options = { :fail_tags => ['any'] }
end

desc "Run knife test"
task :knife do
  sh "bundle exec knife cookbook test #{File.basename(File.dirname(__FILE__))} -c spec/.chef/knife.rb -o '..'"
end

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w(--color)
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end
