class ItemsController < ApplicationController
  def index
  end

  def create
    order = current_order
    order.user = current_user
    order.save

    meal = Meal.find(params[:meal_id])

    Item.create(meal: meal, order: order, quantity: params[:quantity])

    session[:order_id] = order.id
    redirect_to order_path(order)
  end

  def show
  end

  def destroy
  end

  def update
  end

  def new
  end

  def edit
  end


  private

  def item_params
    params.require(:item).permit(:quantity, :meal_id)
  end
end
