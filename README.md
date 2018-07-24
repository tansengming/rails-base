[![CircleCI](https://circleci.com/gh/tansengming/rails-base/tree/develop.svg)](https://circleci.com/gh/tansengming/rails-base/tree/develop)
[![Code Climate](https://codeclimate.com/github/tansengming/rails-base.png)](https://codeclimate.com/github/tansengming/rails-base)
[![Depfu](https://badges.depfu.com/badges/238d26e5741b585f9f886753fe8ef147/count.svg)](https://depfu.com/github/tansengming/rails-base?project=Bundler)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/tansengming/rails-base/tree/develop)

# Rails Bootstrap

If I was going to build a SASS from scratch. These would be the set of tools I would use. Every Rails developer has their favorite set of tools and gems. These happen to be mine.

The Setup includes:

- **Testing** with RSpec and Factory Girl. You can specify retry counts with the `RETRIES` environment variable i.e. `RETRIES=5 bundle exec rspec spec` to retry failing specs 5 times. By default failing specs get retried 3 times.
- **Application Administration** with Active Admin.
- **Application Monitoring** with Rollbar, Skylight and New Relic.
- **Continuous Integration** and Deployment with Circle CI.
- **Continuous Code Checks** with Code Climate
- **Customer Support** with Intercom and Heap
- **Design** with Twitter Bootstrap

# Installation

## Development

### macOS

1. `git clone https://github.com/tansengming/rails-base.git`
1. `cd rails-base`
1. `rm -rf .git`
1. `rm config/secrets.yml.enc`
1. `git init && git add . && git commit -m 'initial commit'`
1. `rails secrets:setup`
1. `rails secrets:edit` and use the values from `config/secrets.yml.sample`
1. `docker-compose up --build`
1. `docker-compose run app rake db:create`
1. `docker-compose run app rake db:migrate`
1. `docker-compose run app rake db:seed`
1. A web server should be running at http://localhost:3000, a client for the SMTP server should be running at http://localhost:1080
1. Sign up for accounts at Skylight, Segment, Heap, Intercom, sendwithus, Code Climate and Circle CI.
1. Update your secrets at `rails secrets:edit` with all the tokens from the accounts you just signed up for.

## Application Notes
- There are 2 levels of admins. Regular admins get to administer the app. Super Admins administer regular admins. You can access them at `/admin` and `/super_admins`.
- You can ping the app at `/up.json` for availability monitoring. If all goes well it will respond with `{"status":"ok"}`.
