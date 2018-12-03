class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :category
      t.text :description
      t.integer :maxservings
      t.datetime :date
      t.integer :shelflife
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
