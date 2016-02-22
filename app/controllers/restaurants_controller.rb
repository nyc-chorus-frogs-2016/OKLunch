class RestaurantsController < ApplicationController

  #### THIS IS JUST SO I CAN GO TO THE CUSTOM ABOUT ####
  #### INSTEAD OF THE LOGIN PAGE ####
  #### KB : Also, delete these comments ####
  skip_before_action :ensure_current_user

  def index
    # @restaurants = Restaurant.all
    unless current_user
      redirect_to about_path
    else
      @target_restaurant = Restaurant.next(current_user)
    end
  end

  def filtered
    search_filter = params[:searchfield].to_sym
    target = params[:search]
    @filtered_restaurants = Restaurant.where("#{search_filter} LIKE ?", "%#{target}%")
    @target_filtered_restaurant = @filtered_restaurants.next(current_user)
  end

  def next_unswiped
    render :json => Restaurant.next(current_user).to_json
  end

end

