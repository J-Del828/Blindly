class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.matches
    raise
  end
end
