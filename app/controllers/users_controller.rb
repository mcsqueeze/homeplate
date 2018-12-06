class UsersController < ApplicationController
  def index
    @markers = @users.map do |user|
    {
      lat: user.latitude,
      lng: user.longitude,
      infoWindow: { content: render_to_string(partial: "/users/map_box", locals: { user: user }) }
    }
  end
  end

  def show
    @user = current_user
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

  private

  def user_params
    params.require(:user).permit(:id)
  end
end


