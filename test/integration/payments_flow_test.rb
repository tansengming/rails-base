require 'test_helper'

class PaymentsFlowTest < ActionDispatch::IntegrationTest
  def fill_and_submit_sign_up_form
    get root_path
    assert_response :success

    # post ''

    # visit '/'
    # click_on 'Sign Up'
    # fill_in 'Email', with: 'email@example.com'
    # fill_in 'Password', with: '12345678'
    # fill_in 'Password confirmation', with: '12345678'
    # click_on 'Sign up'
  end

  test 'should redirect to the payments page' do
    fill_and_submit_sign_up_form
    # assert_equal '/payment/new', page.current_path

    # click_on 'Submit Payment'
    # assert_equal '/user/edit', page.current_path
  end
end



# test "can create an article" do
#   get "/articles/new"
#   assert_response :success
 
#   post "/articles",
#     params: { article: { title: "can create", body: "article successfully." } }
#   assert_response :redirect
#   follow_redirect!
#   assert_response :success
#   assert_select "p", "Title:\n  can create"
# end