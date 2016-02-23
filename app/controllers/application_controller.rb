class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  unless Rails.env.development?
    before_action :authenticate_user!
  else
    def current_user
      User.new(email: 'patryk.ptasinski@in4mates.com')
    end
  end
end
