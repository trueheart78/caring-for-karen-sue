# frozen_string_literal: true

source 'https://rubygems.org'

# Heroku needs this. Update .ruby-version for development
ruby '~> 2.6.6'

gem 'bootsnap'
gem 'coffee-rails', '~> 4.2.0'
gem 'font-awesome-rails', '~> 4.7'
gem 'jquery-rails'
gem 'oj'
gem 'pie-rails', '~>1.1' # progressive internet explorer
gem 'rails', '~> 5.2.5'
gem 'rails-controller-testing'
gem 'rollbar', '~> 2.12'
gem 'sass-rails', '~> 5.0'
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
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'sqlite3', '~> 1.3', '>= 1.3.11'
end

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end

group :production do
  gem 'pg', '~> 0.18.4'
  gem 'rails_12factor', '~> 0.0.3'
end
gem 'nokogiri', '>= 1.7.1'
gem 'puma'
