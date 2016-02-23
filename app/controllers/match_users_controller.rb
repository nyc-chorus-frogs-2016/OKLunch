class MatchUsersController < ApplicationController

  def create
    @swipe = param_1
    @match_user = MatchUser.create!(target_id: @swipe.swipee, creator_id: @swipe.swiper, status: 'Y', accepted: true)
    @conversation = Conversation.create(sender_id: @match_user.creator_id, recipient_id: @match_user.target_id)
    redirect_to match_user_path(@match_user.id)
  end

  def show
    @match_user = MatchUser.find_by(id: params[:id])
    a = Conversation.where(sender_id: current_user.id).where(recipient_id: @match_user.other_user(current_user).id)
    if a.length > 0
      @conversation = a.first
    else
      @conversation = Conversation.where(sender_id: @match_user.other_user(current_user).id).where(recipient_id: current_user.id).first
    end
  end

  def success
    @match_user = MatchUser.find_by(id: params[:id])
    @user = @match_user.target
    render '/match_users/_success'
  end

  def unsuccess
    @match_user = MatchUser.find_by(id: params[:id])
    @user = @match_user.target
    render '/match_users/_unsuccess'
  end

  def match_user_params
    params.permit(:target_id, :accepted, :status).merge(creator_id: current_user.id)
   end

end
