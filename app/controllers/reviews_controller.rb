class ReviewsController < ApplicationController

  def index
  end

  def new
    @review = Review.new
  end

  def create

    @review = Review.create(review_params)
    @review.user = current_user
    @review.meal = Meal.find(params[:meal_id])
    flash[:success] = "You have successfully submitted your review!"
    #redirect_to meals_path


  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating,:content,:meal,:user)
  end
end

