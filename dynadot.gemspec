# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynadot/version'

Gem::Specification.new do |spec|
  spec.name          = "dynadot"
  spec.version       = Dynadot::VERSION
  spec.authors       = ["Eric Yan"]
  spec.email         = ["long@ericyan.me"]
  spec.description   = "Dropcatch domains and manage your Dynadot account with Ruby."
  spec.summary       = "A Ruby interface to the Dynadot's Domain API"
  spec.homepage      = "https://github.com/ericyan/dynadot"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
