# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/lib/downunder')

Gem::Specification.new do |gem|

  ##
  # General configuration / information
  gem.name        = 'downunder'
  gem.version     = DownUnder::Version.current
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = 'Manuel Alabor'
  gem.email       = 'manuel@alabor.me'
  gem.homepage    = 'http://www.github.com/swissmanu/downunder'
  gem.summary     = ''

  ##
  # Files and folder that need to be compiled in to the Ruby Gem
  gem.files         = %x[git ls-files].split("\n")
  gem.require_path  = 'lib'

  ##
  # DownUnder CLI executable
  gem.executables   = ['downunder']

  ##
  # Gem dependencies
  gem.add_dependency 'thor',                ['~> 0.14.6']
  gem.add_dependency 'wkhtmltopdf-binary',  ['~> 0.9.9.1']
  gem.add_dependency 'redcarpet',           ['~> 2.1.1']
  gem.add_dependency 'coderay',             ['~> 1.0.7']

end
