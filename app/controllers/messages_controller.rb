class MessagesController < ApplicationController

  def create
    # binding.pry
    @conversation = Conversation.find_by(id: params[:message][:conversation_id])
    @match_user = MatchUser.find_by(id: params[:message][:match_user_id])
    @message = Message.new(content: params[:message][:content], conversation_id: params[:message][:conversation_id], sender: current_user, recipient: @match_user.other_user(current_user), match_user_id: @match_user.id)
    @message.save
    puts "Hello"
	end

  # private
  # def message_params
  #   params.require(message).permit(:content, :conversation_id, :match_user_id)
  # end
end
