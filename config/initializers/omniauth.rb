Rails.configuration.DAILYCRED_CLIENT_ID = ENV['DAILYCRED_CLIENT_ID']
Rails.configuration.DAILYCRED_SECRET_KEY = ENV['DAILYCRED_SECRET_KEY']

# configure where users should be redirected after authentication
#
# Rails.configuration.DAILYCRED_OPTIONS = {
#   :after_auth => '/hello', #after login
#   :after_unauth => '/goodbye' #after logout
# }
