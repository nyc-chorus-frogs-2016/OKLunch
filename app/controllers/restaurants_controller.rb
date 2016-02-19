class RestaurantsController < ApplicationController

  #### THIS IS JUST SO I CAN GO TO THE CUSTOM ABOUT ####
  #### INSTEAD OF THE LOGIN PAGE ####
  #### KB : Also, delete these comments ####
  skip_before_action :ensure_current_user

  def index
    unless current_user
      redirect_to about_path layout: false
    end
    @restaurants = Restaurant.all
  end

  def filtered
    search_filter = params[:searchfield]
    target = params[:search]
     @filtered_restaurants = Restaurant.where(search_filter.to_sym => target)
  end

end

