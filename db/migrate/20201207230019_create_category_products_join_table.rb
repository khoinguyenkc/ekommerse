class CreateCategoryProductsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :category_products do |t|
      t.belongs_to :product, index:true, foreign_key: true
      t.belongs_to :category, index:true, foreign_key: true

      t.timestamps
    end

  end
end
