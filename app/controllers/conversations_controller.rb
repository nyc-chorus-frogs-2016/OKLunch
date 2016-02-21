class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find_by(id: params[:id])
    @match_user = MatchUser.where(creator_id: @conversation.sender_id, target_id: @conversation.recipient_id)
    @all_messages = @conversation.messages
    @recipient = User.find_by(id: @conversation.recipient_id)
  end
end
