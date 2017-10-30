class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def auth0
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Auth0") if is_navigational_format?
    else
      flash[:error] = 'There was a problem, please try again.'
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end