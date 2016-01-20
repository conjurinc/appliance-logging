# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'conjur/appliance/logging/version'

Gem::Specification.new do |spec|
  spec.name          = "conjur-appliance-logging"
  spec.version       = Conjur::Appliance::Logging::VERSION
  spec.authors       = ["Kevin Gilpin"]
  spec.email         = ["kgilpin@conjur.net"]

  spec.summary       = %q{Appliance standard logging configuration to Conjur web services.}
  spec.homepage      = "https://github.com/conjurinc/appliance-logging"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
