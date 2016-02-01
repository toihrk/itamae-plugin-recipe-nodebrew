# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/nodebrew/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-nodebrew"
  spec.version       = Itamae::Plugin::Recipe::Nodebrew::VERSION
  spec.authors       = ["toihrk"]
  spec.email         = ["toihrk@me.com"]

  spec.summary       = %q{Itamae Recipe 'nodebrew'}
  spec.description   = %q{Itamae Recipe 'nodebrew'}
  spec.homepage      = "https://github.com/toihrk/itamae-plugin-recipe-nodebrew"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.10.5"
  spec.add_development_dependency "rake", "~> 10.4.2"
  spec.add_development_dependency "serverspec", "~> 2.3.1"
end
