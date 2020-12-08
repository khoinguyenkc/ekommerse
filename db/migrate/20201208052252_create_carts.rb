class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.decimal :coupon,  :null => false, :default => 0
      t.decimal :shipping
      t.decimal :taxes
      t.integer :order_id, foreign_key: true
    end
  end
end
