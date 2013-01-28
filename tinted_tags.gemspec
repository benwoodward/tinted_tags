$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tinted_tags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tinted_tags"
  s.version     = TintedTags::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Woodward"]
  s.email       = ["b@benw.me"]
  s.homepage    = "http://benw.me"
  s.summary     = "A Rails 3 engine for creating colour-tinted tag clouds."
  s.description = "TintedTags is a Rails Gem that extends functionality of ActsAsTaggableOn with the ability to assign colours to tags based upon their usage."

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")

  s.add_dependency "rails", ">= 3.2.11"
  s.add_dependency 'acts-as-taggable-on', '~> 2.3.1'
  s.add_development_dependency 'rspec-rails', '~> 2.0'

  s.add_development_dependency "sqlite3"
end
