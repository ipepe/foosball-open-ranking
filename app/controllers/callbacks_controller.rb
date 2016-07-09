class CallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    remember_me(@user)
    if request.env['omniauth.origin'].present? && URI(request.env['omniauth.origin']).scheme == 'fusefoosball'
      redirect_to request.env['omniauth.origin']+"?cookie=#{cookies['remember_user_token']}"
    else
      sign_in_and_redirect @user
    end
  end
end