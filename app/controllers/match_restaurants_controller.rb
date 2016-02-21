class MatchRestaurantsController < ApplicationController
  def create

    @matchrestaurant = MatchRestaurant.create!(matchrestaurant_params)

    if request.xhr?
      render :json => @matchrestaurant.restaurant.to_json
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
    @matchable = @true_matches.return_matchable_users(current_user)

    # @matchable = @true_matches.return_matchable_users(current_user).reject {|user| user == current_user}
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
