[![CircleCI](https://circleci.com/gh/tansengming/rails-base/tree/develop.png)](https://circleci.com/gh/tansengming/rails-base/tree/develop)
[![Code Climate](https://codeclimate.com/github/tansengming/rails-base.png)](https://codeclimate.com/github/tansengming/rails-base)
[![Dependency Status](https://gemnasium.com/tansengming/rails-base.png)](https://gemnasium.com/tansengming/rails-base)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/tansengming/rails-base/tree/develop)

# The SASS Starter Pack

This is an accumulation of all my favorite Rails tools and services. With the boilerplates boilerplated and batteries included. Every Rails developer has their favorite set of tools and gems. These happen to be mine.

`.env.example` includes a good set of ENV variables to set up.

The Setup includes:

- Active Admin, with a super admin role to administer admin users. Endpoints are at  `/admin` and `/super_admins`.
- RSpec, Factory Girl
  - specify retry counts with the `RETRIES` environment variable i.e. `RETRIES=5 bundle exec rspec spec` to retry failing specs 5 times. By default failing specs get retried 3 times.
- Twitter Bootstrap

# macOS Installation

- `brew install redis`
- `brew install postgres`
- `gem install bundler foreman git-up mailcatcher powder`
- `bundle install`
- `cp .env.example .env`
- Sign up for accounts at Skylight, Segment, Heap, Rollbar, Intercom and sendwithus.
- Start all the development services with `foreman start -f Procfile.dev`.