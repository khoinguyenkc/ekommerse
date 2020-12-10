class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :product_id, foreign_key: true
      t.integer :user_id, foreign_key: true
    end
  end
end
