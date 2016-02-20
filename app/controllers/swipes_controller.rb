class SwipesController < ApplicationController

  def create
    @swipe = Swipe.new(swipe_params)
    redirect_to matchrestaurant_success_path
  end

  def swipe_params
    params.require(:swipe).permit(:restaurant_id).merge(user: current_user)
  end

end
