class SwipesController < ApplicationController

	def create
		@swipe = Swipe.create(swipe_params)
		if @swipe.search_for_match(@swipe.swiper)
			if request.xhr?
				@match_user = create_match(@swipe)
				@conversation = Conversation.create(sender_id: @match_user.creator_id, recipient_id: @match_user.target_id)
				render partial: "match_users/success", locals: {user: @match_user.target, conversation: @conversation }, layout: false
			else
				redirect_to match_user_path(@match_user)
				flash[:notice] = "You matched with #{@swipe.swipee.name}!"
			end
		else
			redirect_to match_restaurant_path(params[:match_restaurant_id])
			flash[:notice] = "You have not yet matched with #{@swipe.swipee.name}!"
		end
	end


	private
	def swipe_params
		params.permit(:swipee_id, :direction, :restaurant_id).merge(swiper_id: current_user.id)
	end

	def create_match(swipe)
  		MatchUser.create(creator_id: swipe.swiper_id, target_id: swipe.swipee_id, status: "active", accepted: true)
	end
end
