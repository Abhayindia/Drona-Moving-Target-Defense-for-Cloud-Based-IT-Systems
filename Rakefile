#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Drona::Application.load_tasks

Rake::Task["spec"].clear

require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = '--color --format d --tag ~live --tag ~integration'
end

RSpec::Core::RakeTask.new :live do |t|
  t.rspec_opts = '--color --format d --tag live'
end
