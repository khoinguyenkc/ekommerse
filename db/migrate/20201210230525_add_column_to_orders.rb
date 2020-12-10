class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :paid, :boolean, null: false, default: false
  end
end
