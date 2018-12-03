class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
