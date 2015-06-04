require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DynamicForms
  class Application < Rails::Application
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # I18N
    config.i18n.load_path += Dir[
      Rails.root.join("config/locales/**/*.yml").to_s
    ]
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :"pt-BR"
    I18n.enforce_available_locales = false

    # Time Zone
    config.time_zone = "Brasilia"
  end
end
