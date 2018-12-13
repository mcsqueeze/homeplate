class ItemsController < ApplicationController
  def index
  end

  def create
    order = current_order

    if order.id.nil?
      order = Order.create(user: current_user, state: "pending")
    end

    meal = Meal.find(params[:meal_id])

    quantity_added = false

    order.items.each do |item|
      authorize item
      if item.meal == meal
        item.quantity += params[:quantity].to_i

        if meal.maxservings < item.quantity
          flash[:alert] = "Sorry,there are only #{meal.maxservings} servings available :("
          redirect_to meal_path(meal) and return
        else
          item.save
          quantity_added = true
          redirect_to order_path(order) and return
        end
      end
    end

    unless quantity_added
      if meal.maxservings >= params[:quantity].to_i
        new_item = Item.create(meal: meal, order: order, quantity: params[:quantity])
        authorize new_item
        redirect_to order_path(order) and return
      else
        flash[:alert] = "Maximum #{meal.maxservings}"
        authorize policy_scope(Item)
        redirect_to meal_path(meal)
      end
    end
  end

  def show
    authorize @item
  end

  def destroy
    # @item = current_user.orders.find(params[:id])

    # @order.destroy
    #   if @order.destroyed?
    #     flash[:notice] = "your order was deleted successfully :)"
    #     redirect_to meals_path
    #   else
    #     flash[:notice] = "there was an error, please try again :("
    #     redirect_to order_path(@order)
    #   end
  end

  def update
  end

  def new
  end

  def edit
  end


  private

  def item_params
    params.require(:item).permit(:quantity, :meal_id, :state)
  end
end
