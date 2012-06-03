module Oojs
  module Generators
    class SpecHelperGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_spec_helper
        copy_file 'spec_helper.js.coffee', 'spec/javascripts/spec_helper.js.coffee'
      end
    end
  end
end
