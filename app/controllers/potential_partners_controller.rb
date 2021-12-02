class PotentialPartnersController < ApplicationController
  def index
    if current_user.preferred_age? && current_user.preferred_gender?
      @potential_partners = current_user.potential_partners
    else
      flash.notice = "Please specify your preferred age & gender"
      redirect_to profile_path
    end
  end

  # user = User.find()
  # potential_partners = user.potential_partners

  # first_potential_partner = potential_partners.first

  # # display matching percentage :
  # first_potential_partner.matching_percentage

  # # display common interests list
  # first_potential_partner.common_interests
end
