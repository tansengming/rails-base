namespace :code do
  task :reviews => [:reek, :best_practices]

  task :reek do
    sh 'bundle exec reek -c config/defaults.reek  app/models/'
  end

  task :best_practices do
    sh 'bundle exec rails_best_practices'
  end
end