class UsersController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thanks for registering"
      redirect_to edit_user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @match_restaurants = @user.match_restaurants.where(match: true)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.notice = 'User profile saved'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :age, :background_information, :is_desperate, :interests)
  end

end
