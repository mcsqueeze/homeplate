class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :current_order

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :usertype,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :usertype,
      :password_confirmation, :current_password, :photo, :photo_cache, :remove_photo) }
  end

  def current_order
    if !current_user.nil? and Order.exists?(user_id: current_user.id)
      return Order.where(user_id: current_user.id).where(state: "pending").last
      #
    else
      return Order.new
    end
  end

  def after_sign_in_path_for(resource)
    meals_path
  end

  def after_sign_up_path_for(resource)
    meals_path
  end
end
