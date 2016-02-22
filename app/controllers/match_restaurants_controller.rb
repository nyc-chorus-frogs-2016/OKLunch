class MatchRestaurantsController < ApplicationController
  def create

    @matchrestaurant = MatchRestaurant.create!(matchrestaurant_params)

    if request.xhr?

      if @matchrestaurant.match && @matchrestaurant.is_permanent
        status = "always"
      elsif @matchrestaurant.match && !@matchrestaurant.is_permanent
        status = "yes"
      elsif !@matchrestaurant.match && @matchrestaurant.is_permanent
        status = "never"
      else
        status = "no"
      end

      send_back = {restaurant_name: @matchrestaurant.restaurant.name, matchrestaurant_id: @matchrestaurant.id, stat: status}
      render :json => send_back

    else
      if @matchrestaurant.match
        redirect_to success_match_restaurant_path(@matchrestaurant)
      else
        redirect_to restaurants_path
      end
    end

  end

  def new

  end

  def show
    @match_restaurant = MatchRestaurant.find(params[:id])
    @true_matches = MatchRestaurant.where(restaurant_id: @match_restaurant.restaurant.id, match: true)
    @matchable_users = @true_matches.return_matchable_users(current_user)
  end

  def success
    @match_restaurant = MatchRestaurant.find(params[:id])
    @restaurant = @match_restaurant.restaurant
    render '/match_restaurants/_success'
  end

  def matchrestaurant_params
    params.permit(:restaurant_id, :match, :is_permanent,).merge(user: current_user)
   end
end
