require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TacobitApi
  class Application < Rails::Application
    config.load_defaults 8.0

    # Para usar vistas y helpers HTML en una app API
    config.api_only = false

    config.autoload_lib(ignore: %w[assets tasks])
  end
end
