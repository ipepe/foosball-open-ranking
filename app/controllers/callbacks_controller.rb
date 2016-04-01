class CallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    remember_me(@user)
    sign_in_and_redirect @user
  end
end