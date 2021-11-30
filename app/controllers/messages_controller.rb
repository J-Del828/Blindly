class MessagesController < ApplicationController
  def create
    @relationship = Relationship.find(params[:relationship_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.relationship = @relationship
    if @message.save
      redirect_to relationship_path(@relationship, anchor: "message-#{@message.id}")
    else
      render "relationships/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
