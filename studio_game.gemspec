# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = 'rpapagiannis_studio_game'
  spec.version     = '1.0'
  spec.author      = 'Rafa Papagiannis'
  spec.email       = 'rpapagiannis@icloud.com'
  spec.summary     = 'A simple game written in Ruby'
  spec.homepage    = 'https://github.com/rpapagiannis/pragmatic-studio-ruby-course'
  spec.license     = 'MIT'

  spec.files       = Dir['{bin,lib}/**/*'] + %w[LICENSE.txt README.md]
  spec.executables = ['studio_game']

  spec.required_ruby_version = '>= 3.2.0' # rubocop:disable Gemspec/RequiredRubyVersion
end
