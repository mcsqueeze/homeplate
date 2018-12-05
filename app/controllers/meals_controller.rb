class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @order = Order.new
    @user = current_user
  end

  def new
    @meal = Meal.new
    @picture = Picture.new
    @picture.meal_id = @meal.id
  end

  def create
    @wmeal = meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to meals_path
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
    params.require(:meal).permit(:title, :picture, :description, :price, :category)
  end
end
