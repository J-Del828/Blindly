class PotentialPartnersController < ApplicationController
  def index
    if current_user.gender || current.user.preferred_gender == "Male"
      @users = User.all.where(gender: "Female")
    end
  end
end
