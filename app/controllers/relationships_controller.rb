class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.relationships
  end

  def show
    @relationship = Relationship.find(params[:id])
    # @message = Message.find_by(relationship_id: @relationship.id)
    @message = Message.new
  end

  def decrease_affinity
    @relationship = Relationship.find(params[:id])
    @relationship.affinity -= 2
    @relationship.save
    redirect_to relationship_path @relationship
  end

  def increase_affinity
    @relationship = Relationship.find(params[:id])
    @relationship.affinity += 2
    @relationship.save
    redirect_to relationship_path @relationship
  end
end
