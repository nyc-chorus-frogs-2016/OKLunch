class MatchRestaurantsController < ApplicationController
  def create
    @matchrestaurant = MatchRestaurant.new(matchrestaurant_params)

    if @matchrestaurant.match
      redirect_to matchrestaurants_success_path
    else
      redirect_to restaurants_path
    end

  end

  def new

  end

  def show
    @match_restaurant = MatchRestaurant.find_by(id: params[:id])
  end

  def success
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @user = User.find_by(id: params[:user_id])
    @match_restaurant = MatchRestaurant.create(user_id: @user.id, restaurant_id: @restaurant.id)
  end

  def matchrestaurant_params
    params.permit(:restaurant_id, :match, :is_permanent,).merge(user: current_user)
   end
end
