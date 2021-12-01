class MatchesController < ApplicationController
  def create
    match = Match.create(requester: current_user, partner_id: params[:potential_partner_id], want_match: params[:want])
    relationship = Relationship.find_by(partner_1: params[:potential_partner_id], partner_2: current_user)

    respond_to do |format|
      format.json do
        @go_to_partner_profile = user_path(relationship.partner_1) if relationship
        render json: { new_relationship: relationship.present?, user_url: @go_to_partner_profile }, status: :ok
      end

      format.html do
        flash.notice = "You're matched with #{match.partner.name} " if relationship
        redirect_to potential_partners_path
      end
    end
  end
end
