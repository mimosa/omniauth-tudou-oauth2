# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-tudou-oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-tudou-oauth2"
  spec.version       = Omniauth::TuDouOauth2::VERSION
  spec.authors       = ["Howl王"]
  spec.email         = ["mimosa@shareday.com"]
  spec.description   = %q{OmniAuth Oauth2 strategy for tudou.com.}
  spec.summary       = %q{OmniAuth Oauth2 strategy for tudou.com.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
