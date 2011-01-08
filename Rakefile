require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :spec

desc 'Run KiwiCRM console'
task :console do
  require 'irb'
  require_relative 'lib/kiwicrm'
  include KiwiCRM
  ARGV.clear
  IRB.start
end
