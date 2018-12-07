class ItemsController < ApplicationController
  def index
  end

  def create
    order = current_order()
    if order.id.nil?
      order = Order.create(user: current_user, state: "pending")
    end

    meal = Meal.find(params[:meal_id])

    quantity_added = false

    order.items.each do |item|
      if item.meal_id == meal.id
        item.quantity += params[:quantity].to_i
        item.save
        quantity_added = true

      end
    end

    unless quantity_added
     new_item = Item.create(meal: meal, order: order, quantity: params[:quantity])
    end

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
