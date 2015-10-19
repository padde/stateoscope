# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stateoscope/version'

Gem::Specification.new do |spec|
  spec.name          = 'stateoscope'
  spec.version       = Stateoscope::VERSION
  spec.authors       = ['Patrick Oscity']
  spec.email         = ['patrick.oscity@gmail.com']

  spec.summary       = 'State Machine Visualizer'
  spec.description   = 'Visualize State Machines using GraphViz'
  spec.homepage      = 'https://github.com/padde/stateoscope'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'ruby-graphviz'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'pry'
end
