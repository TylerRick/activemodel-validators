# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "activemodel-validators/version"

Gem::Specification.new do |s|
  s.name        = "activemodel-validators"
  s.version     = Activemodel::Validators::Version
  s.authors     = ["Tyler Rick"]
  s.email       = ["tyler@k3integrations.com"]
  s.homepage    = ""
  s.summary     = %q{Some reusable ActiveModel validations}
  s.description = %q{Some reusable ActiveModel validations, including greater_than, boolean_presence, and at_least_one_present }

  s.rubyforge_project = "activemodel-validators"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activemodel"
  s.add_development_dependency "activerecord"
  s.add_development_dependency "sqlite3"

  # For config/locales
  #s.add_runtime_dependency "railties"
end
