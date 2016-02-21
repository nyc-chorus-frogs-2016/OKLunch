class SwipesController < ApplicationController

	def create
		@swipe = Swipe.create(swipe_params)
		if @swipe.search_for_match(@swipe.swiper) == true
			redirect_to match_user_path(create_match(@swipe))
			flash[:notice] = "You matched with #{@swipe.swipee.name}!"
		else
			redirect_to match_restaurant_path(params[:match_restaurant_id])
		end
	end


	private
	def swipe_params
		params.permit(:swipee_id, :direction, :restaurant_id).merge(swiper_id: current_user.id)
	end
end
