class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = current_user.orders


  end


  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @subtotals = []
      @order.items.each do |item|
        @subtotals << item.meal.price * item.quantity
      end
    @total = @subtotals.sum
    @order.update(amount: @total, state: 'pending')
    @order
  end


  def create
    @user = current_user
    @meal = Meal.find(params[:meal_id])
    @order = Order.create!(amount: @meal.price, state: 'pending', user: current_user)
    redirect_to order_path(@order)
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.state = "deleted"
    @order.destroy
      if @order.destroyed?
        flash[:notice] = "your order was deleted successfully :)"
        redirect_to meals_path
      else
        flash[:notice] = "there was an error, please try again :("
        redirect_to order_path(@order)
      end
  end


  private

  def order_params
    params.require(:order).permit(:meal_id, :url)
  end
end
