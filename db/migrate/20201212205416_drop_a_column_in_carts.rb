class DropAColumnInCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :order_id

  end
end
