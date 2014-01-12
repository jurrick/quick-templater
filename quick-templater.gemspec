# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quick-templater/version'

Gem::Specification.new do |spec|
  spec.name          = "quick-templater"
  spec.version       = QuickTemplater::VERSION
  spec.authors       = ["jurrick"]
  spec.email         = ["jurianp@gmail.com"]
  spec.summary       = %q{Web app template generator}
  spec.description   = %q{Web app theme generator for Ruby On Rails projects}
  spec.homepage      = "http://github.com/jurrick/quick-templater"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
end
