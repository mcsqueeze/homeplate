class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def show
    @order = current_user.orders.find(params[:id])
    @subtotals = []
      @order.items.each do |item|
        @subtotals << item.meal.price * item.quantity
      end
    @total = @subtotals.sum
    @order = Order.update(amount: @total, state: 'pending', user: current_user)
  end

  def create
    @user = current_user
    @meal = Meal.find(params[:meal_id])
    @order = Order.create!(amount: @meal.price, state: 'pending', user: current_user)
    redirect_to order_path(@order)
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:meal_id, :url)
  end
end
