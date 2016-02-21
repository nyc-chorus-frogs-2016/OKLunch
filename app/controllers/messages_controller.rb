class MessagesController < ApplicationController


  def create
    @match_user = MatchUser.find_by(id: params[:match_user_id])
    @message = Message.new(content: params[:content], conversation_id: params[:conversation_id], sender: @match_user.creator, recipient: @match_user.target)
    if @message.save
      flash[:notice] = "Your message was successfully sent"
    else
      flash[:notice] = "Sorry, your message failed to send"
    end
    redirect_to conversation_path(@message.conversation_id)
	end

  # private
  # def message_params
  #   params.require(message).permit(:content, :conversation_id, :match_user_id)
  # end
end
