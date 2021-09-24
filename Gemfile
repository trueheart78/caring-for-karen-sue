# frozen_string_literal: true

source 'https://rubygems.org'

# Heroku needs this. Keep this in sync with .ruby-version, .rubocop.yml, and .circleci/config.yml
ruby '2.7.4'

gem 'bootsnap'
gem 'coffee-rails', '~> 4.2.0'
gem 'font-awesome-rails', '~> 4.7'
gem 'jquery-rails'
gem 'nokogiri', '>= 1.7.1'
gem 'oj'
gem 'pie-rails', '~>1.1' # progressive internet explorer
gem 'puma'
gem 'rails', '~> 6.0.4'
gem 'rails-controller-testing'
gem 'rollbar', '~> 2.12'
gem 'sass-rails', '~> 6.0'
gem 'skylight'
gem 'sparkpost_rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'rails_real_favicon'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'capybara', '~> 2.5'
  gem 'dotenv-rails', '~> 2.2'
  gem 'factory_bot_rails'
  gem 'pry', '~> 0.10.3'
  gem 'rspec-rails', '~> 3.4'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'sqlite3', '~> 1.4.2'
end

group :test do
  gem 'simplecov', require: false
end

group :production do
  gem 'pg', '~> 0.18.4'
end
