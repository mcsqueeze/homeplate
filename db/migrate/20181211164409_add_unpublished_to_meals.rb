class AddUnpublishedToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :published, :boolean, default: true
  end
end
