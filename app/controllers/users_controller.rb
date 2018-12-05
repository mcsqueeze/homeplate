class UsersController < ApplicationController
  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end

  def change_usertype
    if current_user.usertype == "cook"
      current_user.usertype = "customer"
      current_user.save
    else
      current_user.usertype = "cook"
      current_user.save
    end
    redirect_back(fallback_location: root_path)
  end
end
