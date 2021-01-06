class FixTimestampsToOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orders, :created_at, false
    change_column_null :orders, :updated_at, false
  
  end
end
