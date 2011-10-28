$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bluebox/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bluebox"
  s.version     = Bluebox::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Bluebox."
  s.description = "TODO: Description of Bluebox."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
end
