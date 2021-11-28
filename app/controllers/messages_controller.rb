class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  def create
    @relationship = Relationship.find(params[:relationship_id])
    @current_user = current_user
    @message = @current_user.messages.create(content: message_params[:content, relationship_id: @relationship])
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
