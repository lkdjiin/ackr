# -*- encoding: utf-8 -*-

require 'rake'
require 'rspec/core/rake_task'

desc 'Test GEM'
task :default => :spec

desc 'Test GEM with rspec'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  # files.delete FILE_TO_EXCLUDE
  args = files.join(' ')
  sh "reek --quiet #{args} | ./reek.sed"
end
