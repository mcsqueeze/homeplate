class ItemsController < ApplicationController
  def index
  end

  def create
    @meal = Meal.find(params[:id])
    @item = Item.new

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
end
