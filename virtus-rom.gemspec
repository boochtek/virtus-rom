# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtus/rom/version'

Gem::Specification.new do |spec|
  spec.name          = "virtus-rom"
  spec.version       = Virtus::ROM::VERSION
  spec.authors       = ["Craig Buchek"]
  spec.email         = ["craig@boochtek.com"]
  spec.description   = %q{Use Virtus to define ROM (Ruby Object Mapper) model attributes}
  spec.summary       = %q{Use Virtus to define ROM (Ruby Object Mapper) model attributes}
  spec.homepage      = "https://github.com/boochtek/virtus-rom"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('virtus', '~> 1.0.0.rc1')
  spec.add_runtime_dependency('rom', '~> 0.1.2')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
end
