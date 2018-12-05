class ItemsController < ApplicationController
  def index
  end

  def create
    @order = current_order
    @order.user = current_user
    @order.save
    @item = Item.create(meal_id: params[:meal_id], order_id: @order.id)

    session[:order_id] = @order.id
    redirect_to order_path(@order)
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
