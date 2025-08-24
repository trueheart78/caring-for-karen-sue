# Caring For Karen Sue [![Circle CI](https://circleci.com/gh/trueheart78/caring-for-karen-sue.svg?style=shield)](https://circleci.com/gh/trueheart78/caring-for-karen-sue) [![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

Ruby 3.1 and Rails 7.0

## Environment Variables

```
GOOGLE_ANALYTICS_KEY
GOOGLE_ANALYTICS_SITE
ADMIN_EMAIL
RESEND_API_KEY
SKYLIGHT_AUTHENTICATION
PAYPAL_MERCHANT_EMAIL
PAYPAL_HOST
VENMO_USERNAME
WEBSITE_URL
```

## Dotenv Files

The stock `.env` file includes the basics. You should create both an `.env.development` and an `.env.test` file, that include real values.

```sh
cp .env .env.development
vim .env.development
```

## Running Specs

RSpec files exist in `spec/`.

```sh
bundle exec rspec
```

## Viewing Mailers

First, boot the server.

```sh
bundle exec rails s
```

Then head to [http://localhost:3000/rails/mailers][mailers].

## Code Coverage

You can skip the `simplecov` code coverage by using the `SKIP_COVERAGE` environment variable.

```sh
SKIP_COVERAGE=true bundle exec rake spec
```

## Heroku Deployment

Currently, Heroku deployment is automatic upon a `main` branch commit passing CI.

### Database Migrations

These have been automated on deploy, using the `release` section of the `Procfile`.

[mailers]: http://localhost:3000/rails/mailers
