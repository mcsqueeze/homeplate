class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query OR description ILIKE :query"
      @meals = Meal.published.where(sql_query, query: "%#{params[:query]}%")
    else
      @meals = Meal.published.all
    end
  end

  def show

    @meal = Meal.find(params[:id])
    @order = Order.new
    @customer = current_user
    @cook = @meal.user
    @item = Item.new

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

  def unpublish
    @meal = Meal.find(params[:id])
    @meal.published = false
  end



  def edit
  end

  def update
  end

  def destroy
    #let's not delete meals, just unpublish
  end


 private

  def meal_params
    params.require(:meal).permit(:title,:user,:description,:published, :price, :category, pictures_attributes: [:id, :meal_id, :url])
  end
end
