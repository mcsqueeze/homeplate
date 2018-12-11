class PicturesController < ApplicationController
  before_action :set_meal

  def new
    @picture = Picture.new
    @picture.meal = @meal
    authorize @picture
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.meal = @meal

    if @picture.save
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
    authorize @picture
  end

  def destroy
    authorize @picture
  end

  private

  def picture_params
    params.require(:picture).permit(:url, :meal)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
