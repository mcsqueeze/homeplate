class OrdersController < ApplicationController
  def index
  end

  def show
    @order = current_user.orders.find(params[:id])
    @prices = []
    @order.items.each do |item|
      @prices << item.meal.price
      end
    @total = @prices.sum

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
