class MatchesController < ApplicationController
  def create
    match = Match.create(requester: current_user, partner_id: params[:potential_partner_id], want_match: params[:want])
    relationship = Relationship.find_by(partner_1: params[:potential_partner_id], partner_2: current_user)

    respond_to do |format|
      format.json do
        @go_to_chat_url = relationship_path(relationship) if relationship
        render json: { new_relationship: relationship.present?, relationship_url: @go_to_chat_url }, status: :ok
      end

      format.html do
        flash.notice = "You're matched with #{match.partner.name} " if relationship
        redirect_to potential_partners_path
      end
    end
  end
end
