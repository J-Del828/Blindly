class MessagesController < ApplicationController
  def create
    @relationship = Relationship.find(params[:relationship_id])
    @message = Message.create(message_params)
    @message.relationship = @relationship
    @message.partner_2 = current_user
    if @message.save
        redirect_to messages_path(@message, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end
end
