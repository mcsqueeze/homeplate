class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query OR description ILIKE :query"
      @meals = Meal.where(sql_query, query: "%#{params[:query]}%")
    else
      @meals = Meal.all
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @order = Order.new
    @user = current_user
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
    params.require(:meal).permit(:title, :description, :price, :category, pictures_attributes: [:id, :meal_id, :url])
  end
end
