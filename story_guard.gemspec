# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'story_guard/version'

Gem::Specification.new do |spec|
  spec.name          = "story_guard"
  spec.version       = StoryGuard::VERSION
  spec.authors       = ["Shelby Doolittle"]
  spec.email         = ["shelby@shelbyd.com"]
  spec.summary       = %q{Story Guard lets you know which unaccepted stories have commits in your source control.}
  spec.description   = %q{Run story guard before you release to make sure that all your work is ready (or at least know what's not done).}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pivotal-tracker", "~> 0.5"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
