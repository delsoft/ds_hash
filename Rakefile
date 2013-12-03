# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require File.expand_path("../lib/ds_hash/version", __FILE__)

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ds_hash"
  gem.homepage = "https://github.com/delsoft/ds_hash"
  gem.license = "MIT"
  gem.summary = %Q{Hash class extensions }
  gem.description = %Q{Hash class extensions}
  gem.email = "noliveira@telelistas.net"
  gem.author = "nardele salomon"
  gem.files.exclude  'doc/**/*'
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ds_hash version"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :gem do

  desc 'gem build'
  task :build do
      system 'gem build ds_hash.gemspec; mv *.gem pkg'
  end

  desc 'gem release'
  task :release do
      system 'rm pkg/*; rake gem:build; gem push pkg/*'
  end
end
