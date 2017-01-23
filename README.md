[![CircleCI](https://circleci.com/gh/tansengming/rails-base/tree/develop.svg)](https://circleci.com/gh/tansengming/rails-base/tree/develop)
[![Code Climate](https://codeclimate.com/github/tansengming/rails-base.png)](https://codeclimate.com/github/tansengming/rails-base)
[![Dependency Status](https://gemnasium.com/tansengming/rails-base.png)](https://gemnasium.com/tansengming/rails-base)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/tansengming/rails-base/tree/develop)

# The SASS Starter Pack

If I was going to build a SASS from scratch (and I'm not saying that I am). These would be the set of tools I would use. Every Rails developer has their favorite set of tools and gems. These happen to be mine.

The Setup includes:

- **Testing** with RSpec and Factory Girl. You can specify retry counts with the `RETRIES` environment variable i.e. `RETRIES=5 bundle exec rspec spec` to retry failing specs 5 times. By default failing specs get retried 3 times.
- **Application Administration** with Active Admin, with a super admin role to administer admin users. You can access them at `/admin` and `/super_admins`.
- **Application Monitoring** with Rollbar, Skylight and New Relic.
- **Continuous Integration** and Deployment with Circle CI.
- **Continuous Code Checks** with Code Climate
- **Customer Support** with Intercom and Heap
- **Design** with Twitter Bootstrap

# macOS Installation

1. `brew install redis`
1. `brew install postgres`
1. `gem install bundler foreman git-up mailcatcher powder`
1. `bundle install`
1. Sign up for accounts at Skylight, Segment, Heap, Rollbar, Intercom, sendwithus, New Relic, Code Climate and Circle CI.
1. `cp .env.example .env`
1. Update `.env` with all the tokens from the accounts you just signed up for.
1. Start all the development services with `foreman start -f Procfile.dev`.
