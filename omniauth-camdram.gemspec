lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-camdram/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-camdram"
  spec.version       = Omniauth::Camdram::VERSION
  spec.authors       = ["Charlie Jonas"]
  spec.email         = ["devel@charliejonas.co.uk"]
  spec.summary       = %q{Official OmniAuth strategy for Camdram}
  spec.description   = %q{Official OmniAuth strategy for Camdram}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 1.0"
  spec.add_dependency "omniauth-oauth2", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.7"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
end
