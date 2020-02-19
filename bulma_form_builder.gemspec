$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "bulma_form_builder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "bulma_form_builder"
  spec.version     = BulmaFormBuilder::VERSION
  spec.authors     = ["Felix Wolfsteller"]
  spec.email       = ["felix.wolfsteller@gmail.com"]
  spec.homepage    = "https://github.com/fwolfst/bulma_form_builder"
  spec.summary     = "Rough Rails FormBuilder to use with Bulma CSS Framework"
  spec.description = "Rough Rails FormBuilder to use with Bulma CSS Framework"
  spec.license     = "GPLv3+"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 6.0.2"

  spec.add_development_dependency "sqlite3"
end
