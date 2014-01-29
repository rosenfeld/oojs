require "oojs/version"
require 'oojspec'
require 'fake-ajax-server'
require 'jquery-rails'
require 'sinon-rails'

module Oojs
  class Engine < Rails::Engine
    config.sandbox_assets.template ||= 'oojspec/runner'
    config.sandbox_assets.iframe_template ||= 'oojspec/iframe'
  end
end
