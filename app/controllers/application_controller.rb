class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login

  def login(user, password)
    user&.authenticate(password) && session[:user_id] = user.id
  end
end
