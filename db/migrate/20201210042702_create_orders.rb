class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, foreign_key: true
      t.decimal :total_amount
      t.integer :address_id, foreign_key: true
    end
  end
end
