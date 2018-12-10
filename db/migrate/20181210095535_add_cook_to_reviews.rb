class AddCookToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :cook_id, :integer
  end
end
