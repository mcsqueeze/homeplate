class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?

      @meals = Meal.global_search(params[:query])
    else
      @meals = Meal.all
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @order = Order.new
    @customer = current_user
    @cook = @meal.user
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to new_meal_picture_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


 private

  def meal_params
    params.require(:meal).permit(:title, :user, :description, :address, :published, :price, :category, pictures_attributes: [:id, :meal_id, :url])
  end
end
