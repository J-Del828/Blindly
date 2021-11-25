class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def show
    @user = current_user
  end

  def home
  end

  def profile
    @user = current_user
  end

end
