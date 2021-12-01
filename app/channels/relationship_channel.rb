class RelationshipChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @relationship = Relationship.find(params[:id])
    stream_for @relationship
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
