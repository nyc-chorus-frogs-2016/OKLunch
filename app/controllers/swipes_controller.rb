class SwipesController < ApplicationController

	def create
		@swipe = Swipe.new(swipe_params)
		if @swipe.search_for_match(@swipe.swiper) == true
			redirect_to match_user(create_match(@swipe))
		else
			redirect_to match_restaurant(@swipe.restaurant_id)
		end
	end


	private
	def swipe_params
		params.require(:swipe).permit(:swiper_id, :swipee_id, :direction, :restaurant_id)
	end
end