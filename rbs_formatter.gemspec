# frozen_string_literal: true

require_relative "lib/rbs_formatter/version"

Gem::Specification.new do |spec|
  spec.name          = "rbs_formatter"
  spec.version       = RBSFormatter::VERSION
  spec.authors       = ["shoma07"]
  spec.email         = ["23730734+shoma07@users.noreply.github.com"]

  spec.summary       = "RBS Formatter"
  spec.description   = "RBS Formatter"
  spec.homepage      = "https://github.com/shoma07/rbs_formatter"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rbs"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
