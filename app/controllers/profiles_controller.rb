class ProfilesController < ApplicationController

  def show
  end

  def edit

  end

  def update

    if current_user.update(user_params)
      redirect_to profile_path(user_id: current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit( :age, :preferred_age, :gender, :preferred_gender, :biography, :photo, interests: [])
  end
end
