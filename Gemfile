source 'https://rubygems.org'

# adds a Swagger to API
gem 'rswag'


# Rails/Framework
gem 'rails'
gem 'jsonite'
gem 'geokit-rails'

# Persistence
gem 'pg'

# Auth
gem 'devise_token_auth'
gem 'omniauth'

# Use Puma as the app server
gem 'puma'

gem 'phonelib'
gem 'faker'

# Search Provider
gem 'algoliasearch-rails'

# CORS
gem 'rack-cors'

# Error handling
gem 'sentry-raven'

gem 'lograge'

gem 'prometheus-client'

# Background Job Processing
gem 'cron-kubernetes'
gem 'daemons'
gem 'delayed_job_active_record'

group :production do
  gem 'activerecord-nulldb-adapter'
end

gem 'rspec-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'factory_bot_rails'
  gem 'byebug'
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'spring'
  gem 'rubocop'
end

group :test do
  gem 'rspec-collection_matchers'
end
