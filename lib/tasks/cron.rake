# When creating a new task, please remember to:
# - output progress
# - make it idempotent. I.e. running it twice should create twice the trouble.

namespace :cron do
  task :daily
  task :weekly
  task :monthly
end
