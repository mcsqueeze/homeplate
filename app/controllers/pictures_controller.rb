class PicturesController < ApplicationController
  before_action :set_meal

  def new
    @picture = Picture.new
    @picture.meal = @meal
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.meal = @meal

    if @picture.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def picture_params
    params.require(:picture).permit(:url, :meal)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
