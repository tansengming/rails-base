module SecureEndpointHelper
  extend ActiveSupport::Concern

  included do
    include Devise::TestHelpers
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      setup_controller_for_warden
    end
  end
end

# in controller spec
# describe UsersController do
#   include SecureEndpointHelper
#   let(:user) { create(:user) }
#   before { sign_in(:user, user) }
# end