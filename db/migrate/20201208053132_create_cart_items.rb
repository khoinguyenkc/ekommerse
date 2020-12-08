class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.decimal :price
      t.integer :quantity
      t.decimal :amount
      t.decimal :discount, :null => false, :default => 0
      t.string :discount_note
      t.integer :product_id, foreign_key: true
      t.integer :cart_id, foreign_key: true
    end
  end
end
