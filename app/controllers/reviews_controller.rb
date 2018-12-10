class ReviewsController < ApplicationController

  def index
  end

  def new
    @review = Review.new
    @meal = Meal.find(params[:meal_id])
  end

  def create

    @review = Review.new(review_params)
    @review.user = current_user
    @meal = Meal.find(params[:meal_id])
    @review.meal = @meal
    @review.cook = @meal.user
    @review.save
    flash[:success] = "You have successfully submitted your review!"
    redirect_to meals_path


  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating,:content)
  end
end

