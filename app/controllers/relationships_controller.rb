class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.relationships
    raise
  end
end
