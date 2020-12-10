class Product < ApplicationRecord
    has_many :category_products
    has_many :categories, through: :category_products
    has_many :cart_items
    has_many :carts, through: :cart_items
end
