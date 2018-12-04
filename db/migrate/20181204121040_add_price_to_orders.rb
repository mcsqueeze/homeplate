class AddPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment, :jsonb
    add_monetize :orders, :amount, currency: { present: false }
  end
end
