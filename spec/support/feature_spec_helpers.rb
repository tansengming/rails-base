module FeatureSpecHelpers
  def fill_and_submit_sign_up_form(email = 'email@example.com', password = '12345678')
    visit '/'
    click_on 'Sign Up'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Sign up'
  end
end
