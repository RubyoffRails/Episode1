require "rubygems"
require "bundler/setup"
require 'rake/testtask'
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end


desc 'Run MiniTest tests'
Rake::TestTask.new do |t|
  t.pattern = '**/test_*.rb'
end
