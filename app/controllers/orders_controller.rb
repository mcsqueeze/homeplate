class OrdersController < ApplicationController
  def index
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    meal = Meal.find(params[:meal_id])
    order = Order.create!(amount: meal.price, state: 'pending', user: current_user)
    redirect_to payment_user_order_path(order)
  end

  def destroy
  end
end
