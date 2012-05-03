namespace :code do  
  task :reek do
    sh 'bundle exec reek -c config/defaults.reek  app/models/'
  end
end