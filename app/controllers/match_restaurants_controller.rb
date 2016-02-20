class MatchRestaurantsController < ApplicationController
  def create

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
end
