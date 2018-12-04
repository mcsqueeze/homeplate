class MealsController < ApplicationController
  def index
    @meals=Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @order = Order.new
  end

  def new
  end

  def create
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
