$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bluebox/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bluebox"
  s.version     = Bluebox::VERSION
  s.authors     = ["Andrew Hite"]
  s.email       = ["andrew@andrew-hite.com"]
  s.homepage    = "http://andrew-hite.com"
  s.summary     = "A wrapper for the LinkedIn API"
  s.description = "A wrapper for the LinkedIn API"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir.glob("spec/**/*.rb")

  s.add_dependency 'oauth', '~> 0.4.3'
  s.add_dependency 'activesupport', '~> 3.1.0'
  
  s.add_development_dependency 'bundler', '~> 1.0.15'
  s.add_development_dependency 'rspec', '~> 2.6'
  s.add_development_dependency 'webmock', '~> 1.7.7'
  s.add_development_dependency 'vcr', '~> 2.0.0.beta1'
  s.add_development_dependency 'ruby-debug19'
end
