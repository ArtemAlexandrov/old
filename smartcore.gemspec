# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smartcore/version'

Gem::Specification.new do |spec|
  spec.name          = "smartcore"
  spec.version       = Smartcore::VERSION
  spec.authors       = [" Artem Alexandrov"]
  spec.email         = ["svarog278@gmail.com"]

  spec.summary       = %q{Api client to Unified Api of British American Tobacco}
  spec.description   = %q{Api client to Unified Api of British American Tobacco}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "virtus", "~> 1.0"
  spec.add_development_dependency "rails", "~> 4.2.6"
  spec.add_development_dependency "faraday", "~> 0.9"
end
