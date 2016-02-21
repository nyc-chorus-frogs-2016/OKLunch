class MessagesController < ApplicationController


  def create
    @match_user = MatchUser.find_by(id: params[:match_user_id])
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was successfully sent"
    else
      flash[:notice] = "Sorry, your message failed to send"
    end
    redirect_to conversation_path(@message.conversation_id)

	end

  private
  def message_params
    params.require(message).permit(:content, :conversation_id, :user_id)
  end
end
