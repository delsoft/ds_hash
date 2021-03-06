# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

require File.expand_path('../lib/ds_hash/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "ds_hash"
  s.version = "#{DsHash::VERSION}"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["nardele salomon"]
  s.date = "2015-04-15"
  s.description = "Hash class extensions"
  s.email = "del.soft.99@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "ds_hash.gemspec",
    "ds_hash.rb",
    "lib/ds_hash.rb",
    "lib/ds_hash/hash_core_ext.rb",
    "lib/ds_hash/array_core_ext.rb",
    "lib/ds_hash/version.rb",
    "spec/ds_hash_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/delsoft/ds_hash"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Hash class extensions v. #{DsHash::VERSION}"

  s.add_development_dependency(%q<rspec>, ["~> 2.8"])
  s.add_development_dependency(%q<bundler>, ["~> 1.0"])
end

