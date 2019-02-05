class OrdersController < ApplicationController
  after_action :authorize_order, only: [:new, :show, :create, :destroy]

  def index
    @orders = policy_scope(Order).where(user: current_user)
    @reviews_by_user = Review.where(user: current_user)

    @meals_reviewed_by_user = []
    @reviews_by_user.each do |review|
      @meals_reviewed_by_user << review.meal
    end
  end

  def new
    @order = Order.new
  end

  def show
    #@order = Order.find(params[:id])
    @order = current_order
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
    @order = current_user.orders.last
    @order.state = "deleted"
    @order.destroy
      if @order.destroyed?
        flash[:notice] = "Your order was deleted successfully! :)"
        redirect_back(fallback_location: root_path)
      else
        flash[:notice] = "There was an error. Please try again. :("
        redirect_back(fallback_location: root_path)
      end
  end

  private

  def order_params
    params.require(:order).permit(:meal_id, :url)
  end

  def authorize_order
   authorize @order
  end
end
