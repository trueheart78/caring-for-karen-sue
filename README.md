# Caring For Karen Sue [![Circle CI](https://circleci.com/gh/trueheart78/caring-for-karen-sue.svg?style=shield)](https://circleci.com/gh/trueheart78/caring-for-karen-sue)

Ruby 2.7 and Rails 6.1, spec'd out with RSpec 5.

## Environment Variables

```
ROLLBAR_ACCESS_TOKEN
GOOGLE_ANALYTICS_KEY
GOOGLE_ANALYTICS_SITE
ADMIN_EMAIL
SPARKPOST_API_KEY
SKYLIGHT_AUTHENTICATION
```

## Dotenv Files

The stock `.env` file includes the basics. You should create both an `.env.local` and an `.env.test` file, that include real values.

```sh
cp .env .env.local
vim .env.local
```

## Running Specs

RSpec files exist in `spec/`.

```sh
bundle exec rake spec
```

## Viewing Mailers

First, boot the server.

```sh
bundle exec rails s
```

Then head to (http://localhost:3000/rails/mailers)[mailers].

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
