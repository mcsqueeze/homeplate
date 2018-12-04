class RemoveReferenceFromOrders < ActiveRecord::Migration[5.2]
  def change
      remove_reference :orders, :item
  end
end
