class UsersController < ApplicationController
  def index
    @users = User.where.not(latitude: nil, longitude: nil)

    @markers = @users.map do |user|

      {
        lat: user.latitude,
        lng: user.longitude
      }

    end
  end

  def show
    @user = current_user
  end

  def change_usertype
    if current_user.usertype == "cook"
      current_user.usertype = "customer"
    else
      current_user.usertype = "cook"
    end
    current_user.save
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end

