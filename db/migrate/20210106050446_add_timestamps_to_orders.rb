class AddTimestampsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :orders, null: true 

  end
end
