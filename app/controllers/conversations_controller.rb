class ConversationsController < ApplicationController
  def create

  end

  def new

  end

  def show
    @message = Message.new
    @conversation = Conversation.find_by(id: params[:id])
    @match_user = MatchUser.where(creator_id: @conversation.sender_id, target_id: @conversation.recipient_id).first
    @all_messages = @conversation.messages
    @recipient = User.find_by(id: @conversation.recipient_id)
  end
end
