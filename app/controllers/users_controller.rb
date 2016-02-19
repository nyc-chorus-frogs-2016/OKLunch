class UsersController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for registering"
      redirect_to '/users/new'
    else
      render :new
    end
  end

  def show
  
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

end
