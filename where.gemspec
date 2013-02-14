# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'where/version'

Gem::Specification.new do |gem|
  gem.name          = "where"
  gem.version       = Where::VERSION
  gem.authors       = ["Matt Venables"]
  gem.email         = ["mattvenables@gmail.com"]
  gem.description   = %q{A very simple geolocation library for searching based on postal address or ip address.}
  gem.summary       = %q{A simple geolocation library.}
  gem.homepage      = "http://github.com/venables/where"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activesupport"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
