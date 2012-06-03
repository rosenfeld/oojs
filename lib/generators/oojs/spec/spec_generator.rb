module Oojs
  module Generators
    class SpecGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :spec_name, :type => :string

      def create_spec
        template 'spec.js.coffee.erb', "spec/javascripts/#{file_name}_spec.js.coffee"
      end

      def create_fake_ajax_server
        template 'fake_ajax_server.js.coffee.erb', "spec/javascripts/#{file_name}/fake_server.js.coffee"
      end

      private

      def file_name
        @file_name ||= spec_name.underscore
      end

      def class_name
        @class_name ||= spec_name.camelize
      end
    end
  end
end
