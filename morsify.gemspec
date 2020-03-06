# encoding: utf-8
require_relative 'lib/morsify/version'

Gem::Specification.new do |spec|
  spec.name          = "morsify"
  spec.version       = Morsify::VERSION
  spec.authors       = ["dionixs"]
  spec.email         = ["dionixs@tutanota.com"]

  spec.summary       = %q{Morse code encoder and decoder with supports Latin, Cyrillic.}
  spec.homepage      = "https://github.com/dionixs/morsify"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.executables = ["morsify"]
  spec.require_paths = ["lib"]
  spec.files = Dir["lib/**/*", "src/**/*"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")
  spec.add_development_dependency 'bundler', '~> 2.1.2'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.1'
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'tty-prompt', '~> 0.20.0'
  spec.add_development_dependency 'wavefile', '~> 1.1', '>= 1.1.1'
end
