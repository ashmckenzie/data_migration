# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_migration/version'

Gem::Specification.new do |gem|
  gem.name          = "data_migration"
  gem.version       = DataMigration::VERSION
  gem.authors       = ["Ash McKenzie"]
  gem.email         = ["ash@greenworm.com.au"]
  gem.description   = 'Data migration support for Rails'
  gem.summary       = 'Data migration support for Rails, like schema migrations but for data!'
  gem.homepage      = ""

  gem.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"] - ["Gemfile.lock"]
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rails', '~> 3.0.9'
end
