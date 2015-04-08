# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lepreshawn/version'

Gem::Specification.new do |spec|
  spec.name          = "lepreshawn"
  spec.version       = Lepreshawn::VERSION
#  spec.authors       = "Joon Ki Choi"
#  spec.email         = "joon-ki.choi@outlook.com"
  spec.authors       = "Joon Ki Choi"
  spec.email         = "joon.ch@gmail.com"

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{generates lottery drawings}
#  spec.description   = %q{TODO: Write a longer description or delete this line.}
#  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
