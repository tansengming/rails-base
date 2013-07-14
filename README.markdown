[![Build Status](https://travis-ci.org/tansengming/rails-base.png?branch=develop)](https://travis-ci.org/tansengming/rails-base)
[![Coverage Status](https://coveralls.io/repos/tansengming/rails-base/badge.png?branch=develop)](https://coveralls.io/r/tansengming/rails-base?branch=develop)
[![Code Climate](https://codeclimate.com/repos/51df69fb13d6374f780068ad/badges/c76b71b4327cf8984a9f/gpa.png)](https://codeclimate.com/repos/51df69fb13d6374f780068ad/feed)

Every Rails developer has their favorite set of tools and gems. These just happen to be mine.

Setup includes:

- Active Admin, together with a super admin role to administer admin users. Endpoints are at  `/admin` and `/super_admins`.
- Deliver all your pivotal stories with `rake pivotal:deliver_all_finished`.
- `rake code:reviews` runs Reek, rails_best_practices. Do this often.
- RSpec, Factory Girl, Steak, Devise test helpers and Twitter Bootstrap setup and running.
