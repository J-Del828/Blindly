class MessagesController < ApplicationController
  def create
    #@relationship = Relationship.find(params[:relationship_id])
    @current_user = current_user
    @message = Message.create(message_params)
    @message.relationship = @relationship
    if @message.save
      redirect_to messages_path(@message, anchor: "message-#{@message.id}")
    else
      render "new"
    end

    private
    def message_params
      params.require(:message).permit(:content)
    end
  end
end
