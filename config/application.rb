require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KwuxFrontend
  class Application < Rails::Application
    # Application Version
    VERSION = "0.0.1-dev3"

    # https://github.com/rails/tailwindcss-rails/issues/153
    config.assets.css_compressor = nil

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # https://stackoverflow.com/questions/36602764/how-to-use-npm-packages-in-rails
    config.assets.paths << Rails.root.join('node_modules')

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.fathom = { site_id: ENV.fetch("FATHOM_ANALYTICS_SITE_ID", "") }
  end
end
