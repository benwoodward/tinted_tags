require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'ammeter/init'

begin
  require 'rails'
  require 'bundler'

  if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.5")
    raise RuntimeError, "Your bundler version is too old." +
     "Run `gem install bundler` to upgrade."
  end

  # Set up load paths for all bundled gems
  Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems." +
    "Did you run \`bundlee install\`?"
end

Bundler.require

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.order = "random"
end

