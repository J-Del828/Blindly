class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.relationships.order(:created_at)
  end

  def show
    @relationship = Relationship.find(params[:id])
    # @message = Message.find_by(relationship_id: @relationship.id)
    @message = Message.new
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to relationships_path
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
