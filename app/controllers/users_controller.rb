class UsersController < ApplicationController

  def new
    # signup form
  end

  def show
    render json: { hi: 'hello' }
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :password, :password_confirmation))
    unless @user.persisted?
      redirect_to :new_user
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end
end
