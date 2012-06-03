require "oojs/version"
require 'rails_sandbox_jasmine'
require 'fake-ajax-server'
require 'jquery-rails'
require 'sinon-rails'

module Oojs
  class Engine < Rails::Engine
    config.sandbox_assets.template ||= 'jasmine/runner'
  end
end
