# frozen_string_literal: true

require File.expand_path('boot', __dir__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AskdarcelApi
  class Application < Rails::Application
    config.api_only = true

    # Algolia
    config.x.algolia.application_id = ENV['ALGOLIA_APPLICATION_ID']
    config.x.algolia.api_key = ENV['ALGOLIA_API_KEY']
    # Differentiate indexes for different AskDarcel instances.
    config.x.algolia.index_prefix = ENV['ALGOLIA_INDEX_PREFIX']

    config.x.algolia.enabled = [
      config.x.algolia.application_id.present?,
      config.x.algolia.api_key.present?,
      config.x.algolia.index_prefix.present?
    ].all?

    config.x.google.api_key = ENV['GOOGLE_API_KEY']

    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      rewrite   %r{/api(.*)}, '$1'
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'devmission-askdarcel-web.herokuapp.com', 'localhost:8080', 'localhost:3030'
        resource '*', headers: :any, methods: %i[get post options], expose: ['Access-Token', 'Client', 'Uid']
      end
    end
    config.after_initialize do
      Rails.env.production? do
        ActiveRecord::Migrator.migrate "db/migrate"
      end
    end

    config.active_job.queue_adapter = :delayed_job
  end
end
