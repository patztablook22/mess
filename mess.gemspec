require_relative 'lib/mess/version'

Gem::Specification.new do |spec|
  spec.name          = "mess"
  spec.version       = Mess::VERSION
  spec.authors       = ["patztablook22"]
  spec.email         = ["patz@tuta.io"]

  spec.summary       = "Facebook Messenger Statistician"
  spec.description   = "Analyze your archived Messenger chatlogs in JSON format!"
  spec.homepage      = "https://github.com/patztablook22/mess"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(__dir__) do
    Dir["**/*"].reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-prompt", "~> 0.23"
  spec.add_dependency "tty-option", "~> 0.1"
end
