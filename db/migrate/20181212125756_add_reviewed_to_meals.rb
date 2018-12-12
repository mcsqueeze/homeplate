class AddReviewedToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :reviewed, :boolean, default: false
  end
end
