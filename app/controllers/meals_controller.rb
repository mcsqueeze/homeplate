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

  def available_quantity
    #@quantities_bought = []
   # @meal_ordered = Item.where("meal_id = ?", params[:meal])
    #@meals_ordered.each do |item|
      #@quantities_bought << item.quantity
    #end
    #@total_quantity_bought
    #@quantities_bought.each do |q|
     # @total_quantity_bought << q
    #end
    #@meal.maxservings -= @meal_ordered.quantity

  end


  private

  def meal_params
    params.require(:meal).permit(:title,:user,:description, :price, :category, pictures_attributes: [:id, :meal_id, :url])
  end
end
