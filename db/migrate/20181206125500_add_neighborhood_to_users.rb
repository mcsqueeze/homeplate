class AddNeighborhoodToUsers < ActiveRecord::Migration[5.2]
  def change
        add_column :users, :neighborhood, :string
  end
end
