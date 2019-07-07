# frozen_string_literal: true

version_file = 'lib/marquetapage/version'
require File.expand_path("../#{version_file}", __FILE__)

Gem::Specification.new do |s|
  s.name = 'marquetapage'
  s.date = Time.now.utc.strftime('%Y-%m-%d')
  s.version = Marquetapage::VERSION
  s.homepage = "http://github.com/spk/#{s.name}"
  s.authors = ['Laurent Arnoud']
  s.email = 'laurent@spkdev.net'
  s.description = 'marquetapage'
  s.summary = 'Extract to JSON bookmarks from `places.sqlite` with specific tag'
  s.extra_rdoc_files = %w[README.md]
  s.bindir = 'bin'
  s.executables << 'marquetapage'
  s.files = Dir['LICENSE', 'README.md', 'Gemfile', 'bin', 'lib/**/*.rb',
                'test/**/*']
  s.license = 'MIT'
  s.test_files = Dir.glob('test/*_test.rb')
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.3.0'
  s.add_dependency 'json', '~> 2.0'
  s.add_dependency 'sequel', '~> 5'
  s.add_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'rake', '~> 11'
  s.add_development_dependency 'rubocop', '~> 0.72.0'
end
