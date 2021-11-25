class PotentialPartnersController < ApplicationController
  def index
    @potential_partners = current_user.potential_partners
    @positive_match = Match.new(want_match: true)
  end

  # user = User.find()
  # potential_partners = user.potential_partners

  # first_potential_partner = potential_partners.first

  # # display matching percentage :
  # first_potential_partner.matching_percentage

  # # display common interests list
  # first_potential_partner.common_interests
end
