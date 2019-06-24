$:.unshift(File.expand_path(File.dirname(__FILE__) + '/lib'))
require 'nutriscore/version'

Gem::Specification.new do |s|
  s.name             = 'nutriscore'
  s.version          = Nutriscore::VERSION
  s.date             = Nutriscore::VERSION_DATE
  s.summary          = 'Nutri-score computation for food products.'
  s.authors          = ['wvengen']
  s.email            = ['dev-ruby@willem.engen.nl']
  s.homepage         = 'https://github.com/q-m/nutriscore-ruby'
  s.license          = 'MIT'
  s.metadata         = {
    'bug_tracker_uri' => 'https://github.com/q-m/nutriscore-ruby/issues',
    'source_code_uri' => 'https://github.com/q-m/nutriscore-ruby',
  }

  s.files            = `git ls-files *.gemspec lib`.split("\n")
  s.executables      = `git ls-files bin`.split("\n").map(&File.method(:basename))
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.require_paths    = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-its'
end
