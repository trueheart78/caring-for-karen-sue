# CaringForKarenSue, Rails 5.2 Edition

[![Circle CI](https://circleci.com/gh/trueheart78/CaringForKarenSue-Rails.svg?style=shield)](https://circleci.com/gh/trueheart78/CaringForKarenSue-Rails)

Ruby 2.6 and Rails 5.2, spec'd out with RSpec 3.

## Environment Variables

```
ROLLBAR_ACCESS_TOKEN
GOOGLE_ANALYTICS_KEY
GOOGLE_ANALYTICS_SITE
ADMIN_EMAIL
```

The stock `.env` file includes the basics. You should create local `.env.local` and `.env.test` files, that include real values.

```sh
cp .env .env.local
vim .env.local
```

## Running Specs

RSpec files exist in `spec/`

```sh
bundle exec rake spec
```

## Code Coverage

You can skip the `simplecov` code coverage by using the `SKIP_COVERAGE` environment variable.

```sh
SKIP_COVERAGE=true bundle exec rake spec
```
