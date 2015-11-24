# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudat/version'

Gem::Specification.new do |spec|
  spec.name          = 'cloudat'
  spec.version       = Cloudat::VERSION
  spec.authors       = ['Ben Vidulich']
  spec.email         = ['ben@vidulich.co.nz']
  spec.summary       = %q{Run cloud infrastructure actions on a schedule}
  spec.description   = %q{Run cloud infrastructure actions on a schedule}
  spec.homepage      = 'https://github.com/zl4bv/cloudat'
  spec.license       = 'New BSD License'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'rufus-scheduler', '~> 3.1'
end
