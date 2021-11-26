class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.relationships
  end

  def show
    @relationship = Relationship.find(params[:id])
    @message = Message.find_by(relationship_id: @relationship.id)
  end
end
