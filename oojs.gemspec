# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oojs/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rodrigo Rosenfeld Rosas"]
  gem.email         = ["rr.rosas@gmail.com"]
  gem.summary       = %q{Object-oriented JavaScript (or CoffeeScript) for Rails}
  gem.description   = %q{This is a bundle of tools for helping you
    to create well organized client-side
    code to be run in browsers covered by tests (or specs) in an easy way.}
  gem.homepage      = "http://github.com/rosenfeld/oojs"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "oojs"
  gem.require_paths = ["lib"]
  gem.version       = Oojs::VERSION

  gem.add_dependency 'oojspec', '>= 0.1.2'
  gem.add_dependency 'fake-ajax-server', '>= 0.0.2'
end
