class MatchRestaurantsController < ApplicationController
  def create

    @matchrestaurant = MatchRestaurant.create!(matchrestaurant_params)
    if @matchrestaurant.match
      redirect_to success_match_restaurant_path(@matchrestaurant)
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
    @match_restaurant = MatchRestaurant.find_by(id: params[:id])
    @restaurant = @match_restaurant.restaurant
    render '/matchrestaurants/_success'
  end

  def matchrestaurant_params
    params.permit(:restaurant_id, :match, :is_permanent,).merge(user: current_user)
   end
end
