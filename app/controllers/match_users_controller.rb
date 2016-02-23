class MatchUsersController < ApplicationController
  def create
    #you have a swipe
    #swipe has a swiper and swipee and a restaurant
    #pass swipe in here
    @swipe = param_1
    @match_user = MatchUser.create!(target_id: @swipe.swipee, creator_id: @swipe.swiper, status: 'Y', accepted: true)
    redirect_to match_user_path(@match_user.id)

    # if @new_match = MatchUser.create!(match_user_params)
    #   redirect_to success_match_user_path(@new_match)
    # else
    #   redirect_to match_user_path
    # end
  end

  def show
    @match_user = MatchUser.find_by(id: params[:id])
    @conversation = Conversation.create(sender_id: @match_user.creator_id, recipient_id: @match_user.target_id)
  end

  def success
    @match_user = MatchUser.find_by(id: params[:id])
    @user = @match_user.target
    render '/match_users/_success'
  end

  def match_user_params
    params.permit(:target_id, :accepted, :status).merge(creator_id: current_user.id)
   end

end
