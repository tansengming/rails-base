PIVOTAL = {
  :token => 'your_token',
  :project_id => 'your_project_id'
}

namespace :pivotal do
  task :deliver_all_finished => :environment do
    line = Cocaine::CommandLine.new("curl", "-H 'X-TrackerToken: #{PIVOTAL[:token]}' -X PUT https://www.pivotaltracker.com/services/v3/projects/#{PIVOTAL[:project_id]}/stories/deliver_all_finished -d ''")
    puts "Running #{line.command}"
    line.run
  end
end