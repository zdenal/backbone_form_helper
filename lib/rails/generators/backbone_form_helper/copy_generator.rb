module BackboneFormHelper
  module Generators
    class CopyGenerator < ::Rails::Generators::Base
      desc "Copy files into your project (default vendor/assetes/..)"
      source_root File.expand_path('../../../../../vendor/assets/', __FILE__)
      argument :destination, type: :string, default: 'vendor/assets/'

      def create_initializer
        directory "#{source_paths.first}/javascripts/form_helper", "#{destination}javascripts/form_helper"
        directory "#{source_paths.first}/stylesheets/form_helper", "#{destination}stylesheets/form_helper"
      end
    end
  end
end
