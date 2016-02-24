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
    @user.name = @user.name.capitalize
    @match_restaurants = @user.match_restaurants.where(match: true)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    interests_array = user_params[:interests].split(",")
    interests_array.map! {|interest_name| interest_name.downcase.strip}
    interests_array.map! {|interest| Interest.find_or_create_by(name: interest)}
    interests_array.uniq!
    updateable_params = user_params.dup
    updateable_params.delete(:interests)

    if @user.update(updateable_params)
      @user.interest_users.each { |im| im.destroy}
      interests_array.each do |new_interest|
        @user.interests << new_interest
      end
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
