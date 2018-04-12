class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless login(user, params[:user][:password])
    redirect_to '/logged_in'
  end

  def new
    # login form
  end

  def destroy
    session.delete :user_id
  end
end
