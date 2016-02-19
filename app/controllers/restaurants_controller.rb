class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def filtered
    search_filter = params[:searchfield]
    target = params[:search]
     @filtered_restaurants = Restaurant.where(search_filter.to_sym => target)
  end

end

