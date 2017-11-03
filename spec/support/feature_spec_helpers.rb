module FeatureSpecHelpers
  def fill_and_submit_sign_up_form(email = 'email@example.com', password = '12345678')
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      provider: 'auth0',
      uid: rand(1000000),
      info: {email: email}
    })

    visit '/'
    click_on 'Login'
  end
end
