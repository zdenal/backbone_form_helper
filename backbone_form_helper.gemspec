# -*- encoding: utf-8 -*-
require File.expand_path('../lib/backbone_form_helper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zdenal"]
  gem.email         = ["nevralaz@gmail.com"]
  gem.description   = %q{Form helper for backbone based on Rails priciple -> f.text_field :name}
  gem.summary       = %q{Backbone form helper}
  gem.homepage      = "http://github.com/zdenal/backbone_form_helper.git"
  gem.rubyforge_project = "backbone_form_helper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "backbone_form_helper"
  gem.require_paths = ["lib"]
  gem.version       = BackboneFormHelper::VERSION
end
