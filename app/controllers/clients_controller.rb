class ClientsController < ApplicationController
  after_action :authorize_user, only: [:index]

  def index
    @users = User.where.not(latitude: nil, longitude: nil)

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def dashboard
    @meals = current_user.meals
    @active_meals = current_user.meals.published
    @inactive_meals = current_user.meals.unpublished
  end

  def show
    @meals = current_user.meals
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

  def authorize_user
    authorize @user
  end
end
