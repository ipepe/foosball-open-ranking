class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!

  unless Rails.env.development?
    before_action :authenticate_user!
  else
    def current_user
      User.find_or_create_by!(email: 'developer@example.com') do |user|
        user.first_name= 'Dev'
        user.last_name = 'Eloper'
      end
    end
  end
end
