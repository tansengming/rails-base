module FeatureSpecHelpers
  def login(email: 'email@example.com', password: '12345678')
    visit '/'
    click_on 'Login'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log in'
  end
end
