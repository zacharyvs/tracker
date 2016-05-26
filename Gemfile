source 'https://rubygems.org'

ruby '2.3.0'

gem 'active_model_serializers'
gem 'attr_defaultable', require: 'extend_attr_defaultable'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'rails', '4.2.6'
gem 'rails-api'

group :development, :test do
  gem 'active_cucumber'
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'dotenv'
  gem 'factory_girl_rails'
  gem 'rack-test'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'shoulda'
  gem 'simplecov'
  gem 'simplecov-html'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'annotate'
  gem 'spring'
  gem 'swagger-docs'
end
