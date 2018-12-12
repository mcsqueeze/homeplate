class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  after_action :authorize_meal, only: [:new, :create, :edit, :update, :destroy, :dashboard, :show, :publish ]

  def index
    if params[:query].present?
      @meals = policy_scope(Meal).global_search(params[:query])
      @cooks = @meals.map { |meal| meal.user unless meal.user.latitude.nil?}

        @markers = @cooks.map do |cook|
        {
          lng: cook.longitude,
          lat: cook.latitude,
          infoWindow: {
            content: render_to_string(partial: "/users/map_window", locals: { user: cook })}
        }
        end
    else
      @meals = policy_scope(Meal).order(created_at: :desc)
      @cooks = @meals.map { |meal| meal.user unless meal.user.latitude.nil?}

        @markers = @cooks.map do |cook|
        {
          lng: cook.longitude,
          lat: cook.latitude,
          infoWindow: {
            content: render_to_string(partial: "/users/map_window", locals: { user: cook })}
        }
        end
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @order = Order.new
    @customer = current_user
    @cook = @meal.user
    @item = Item.new
    unpublish_when_soldout
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.published = true
    @meal.user = current_user
    if @meal.save
      redirect_to new_meal_picture_path(@meal)
    else
      render :new
    end
  end

  def publish
    @meal = Meal.find(params[:id])
    if @meal.published
      @meal.published = false
    else
      @meal.published = true
    end
    @meal.save

    redirect_to meal_path(@meal)
  end

  def unpublish_when_soldout
    if @meal.maxservings == 0
      @meal.published = false
    end

  end

  def edit
  end

  def update
  end

  def destroy
    #let's not delete meals, just unpublish
  end

  def dashboard
  end

 private

  def meal_params
    params.require(:meal).permit(:title, :user, :description, :address, :published, :price, :category, pictures_attributes: [:id, :meal_id, :url])
  end

  def authorize_meal
    authorize @meal
  end
end
