class SwipesController < ApplicationController

	def create
		@swipe = Swipe.create(swipe_params)

		if @swipe.direction
			if @swipe.parallel_positive_swipe_exists

				@match_user = create_match(@swipe)
				@conversation = Conversation.create(sender_id: @match_user.creator_id, recipient_id: @match_user.target_id)

				if request.xhr?
					render partial: "match_users/success", locals: {user: @match_user.target, conversation: @conversation }, layout: false
				else
					flash[:notice] = "You matched with #{@swipe.swipee.name}!"
				end

			else
				render partial: "match_users/unsuccess", locals: {user: @swipe.swipee, swipe: @swipe }, layout: false
				flash[:notice] = "You have not yet matched with #{@swipe.swipee.name}!"
			end
		else
			render partial: "match_users/unsuccess", locals: {user: @swipe.swipee, swipe: @swipe }, layout: false
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
