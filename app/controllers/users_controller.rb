class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  after_action :authorize_user, only: [:show, :change_usertype, :dashboard]

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
    @user = current_user
    @meals = current_user.meals

    @active_meals = @meals.where(published: true)
    @inactive_meals = @meals.where(published: false)
    @ratings = []
    @user.cook_reviews.each do |review|
      @ratings << review.rating
    end

  end

  def show
    @meals = current_user.meals
    @user = current_user

    @active_meals = @meals.where(published: true)
    @inactive_meals = @meals.where(published: false)

    @cook = User.find(params[:id])

    @ratings = []
    @user.cook_reviews.each do |review|
      @ratings << review.rating
    end

    if !@ratings.nil?
      @average_rating = (((@ratings.sum) / @ratings.count.to_f) * 100).round / 100.0
    else
      @average_rating = nil
    end

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
