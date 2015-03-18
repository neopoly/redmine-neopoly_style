# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "neopoly_style/version"
require "neopoly_style/infos"

Gem::Specification.new do |spec|
  spec.name          = "redmine-neopoly_style"
  spec.version       = NeopolyStyle::VERSION
  spec.authors       = NeopolyStyle::Infos::AUTHORS.keys
  spec.email         = NeopolyStyle::Infos::AUTHORS.values
  spec.summary       = NeopolyStyle::Infos::DESCRIPTION
  spec.description   = NeopolyStyle::Infos::DESCRIPTION
  spec.homepage      = NeopolyStyle::Infos::URL
  spec.license       = NeopolyStyle::Infos::LICENSE

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
end
