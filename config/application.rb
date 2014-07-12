require File.expand_path('../boot', __FILE__)
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module AwesomeEvents
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
		config.action_dispatch.default_headers.delete('X-Frame-Options')
  end
end
