# frozen_string_literal: true

source "https://rubygems.org"

# Heroku needs this. Keep this in sync with .ruby-version and .circleci/config.yml
ruby "~> 3.1.6"

# gem "gem_name", git: "repo url", branch: "specific branch of said repo", ref: "reference hash"
gem "bootsnap"
gem "coffee-rails", "~> 5.0"
gem "font-awesome-rails", "~> 4.7"
gem "jquery-rails"
gem "logger"
gem "nokogiri"
gem "oj"
gem "puma"
gem "rails", "~> 7.0.0"
gem "rack-attack", "~> 6.0"
gem "sass-rails", "~> 6.0"
gem "skylight"
gem "sparkpost_rails", git: "https://github.com/sunny/sparkpost_rails/", branch: "allow-rails-seven"

gem "turbolinks"
gem "uglifier", ">= 1.3.0"

group :development do
  gem "rails_real_favicon"
  gem "web-console"
end

group :development, :test do
  gem "capybara", "~> 3.38"
  gem "dotenv", require: "dotenv/load"
  gem "factory_bot_rails"
  gem "pry", "~> 0.14.2"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 6.0"
  gem "spring"
  gem "sqlite3", "~> 1.6.1"

  # Linter-related
  gem "standard", require: false
  gem "rubocop-rails", require: false
end

group :test do
  gem "simplecov", require: false
end

group :production do
  gem "pg", "~> 1.5.6"
end
