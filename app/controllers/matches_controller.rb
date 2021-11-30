class MatchesController < ApplicationController
  def create
    match = Match.create(requester: current_user, partner_id: params[:potential_partner_id], want_match: params[:want])
    relationship = Relationship.find_by(partner_1: params[:potential_partner_id], partner_2: current_user)
    if relationship
      flash.notice = "You're matched with #{match.partner.name} "
    end
    respond_to do |format|
      format.html { redirect_to potential_partners_path }
      format.text { head :ok }
    end
  end
end
