class Profile < ApplicationRecord

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params:[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end
end
