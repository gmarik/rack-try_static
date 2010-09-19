#!/usr/bin/env gem build
# encoding: utf-8
# vim: ft=ruby

require "base64"

Gem::Specification.new do |s|
  s.name = "rack-try_static"
  s.version = "0.1.1"
  s.date = Time.now.strftime '%Y-%m-%d'

  s.authors = ["gmarik"]
  s.email = Base64.decode64("Z21hcmlrQGdtYWlsLmNvbQ==\n")

  s.homepage = "http://github.com/gmarik/rack-try_static"
  s.summary = "rack middleware to serve static files with specified patterns"
  s.description = "#{s.summary}. Check out http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free for more..."

  s.cert_chain = nil

  # files
  s.files = `git ls-files`.split("\n")

  #Dir["bin/*"].map(&File.method(:basename))
  #s.default_executable = "example"
  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new(">= 1.8.6")

  # dependencies
  # RubyGems has runtime dependencies (add_dependency) and
  s.add_dependency 'rack', '1.1.0'

  s.has_rdoc = false
  #s.extra_rdoc_files = %w[README.rdoc COPYING]

  # development dependencies (add_development_dependency)
  s.add_development_dependency "test-spec"

  s.require_paths = %w[lib]
  s.test_files = s.files.select {|path| path =~ /^test\/spec_.*\.rb/}

  #s.post_install_message = s.name + ' installed'

  # RubyForge
  #s.rubyforge_project = "example"
end

