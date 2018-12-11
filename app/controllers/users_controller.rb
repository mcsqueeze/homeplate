class UsersController < ApplicationController
  after_action :authorize_user, only: [:show, :change_usertype]

  def index
    @users = policy_scope(User).where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: {
          content: render_to_string(partial: "/users/map_window", locals: { user: user })}
        }
      end
  end


  def dashboard
    @meals = current_user.meals
    @active_meals = Meal.published(@meals)
    @inactive_meals = Meal.unpublished(@meals)
  end

  def show
    @meals = current_user.meals
    @user = current_user
  end

  def change_usertype
  @user = current_user
    if current_user.usertype == "cook"
      current_user.usertype = "customer"
    else
      current_user.usertype = "cook"
    end
    current_user.save
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end

  def authorize_user
    authorize @user
  end
end
