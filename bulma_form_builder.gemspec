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

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 6.0.2"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "htmlentities"
end
