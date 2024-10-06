# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.4'
gem 'active_model_serializers'
gem 'active_storage_validations', '~> 1.1.3'

gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-entity'

gem 'pg'
gem 'puma', '>= 5.0'
gem 'redis', '>= 4.0.1'
gem 'rack-cors'

gem 'sidekiq'
gem 'httparty'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem 'jbuilder'

gem 'tzinfo-data', platforms: %i[ windows jruby ]
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri windows ]
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.1.4'
  gem 'rswag-specs'
  gem 'dotenv-rails'
end

group :development do
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'ffaker', '~> 2.20'
  gem 'factory_bot_rails'
  gem 'capybara', '~> 3.36'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webmock', '~> 3.18'
  gem 'vcr'
end
