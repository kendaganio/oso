# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/oso/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "oso"
  spec.version       = Oso::VERSION
  spec.authors       = ["Ken-Lauren Daganio"]
  spec.email         = ["akosiken@gmail.com"]
  spec.summary       = %q{A gem that shows a bear}
  spec.description   = %q{A gem that shows a beaaaaarrrrrr}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['oso']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "thor"
end
