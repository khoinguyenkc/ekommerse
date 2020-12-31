class Product < ApplicationRecord
    has_many :category_products
    has_many :categories, through: :category_products
    has_many :cart_items
    has_many :carts, through: :cart_items

    scope :low_to_high, -> { order(current_price: :asc) }
    scope :high_to_low, -> { order(current_price: :desc) }

    scope :costs_more_than, ->(amount) { where("current_price > ?", amount) }
    scope :costs_less_than, ->(amount) { where("current_price < ?", amount) }
    #price range usage: Product.costs_more_than(50).merge(Product.costs_less_than(400))


    def new_products
        #placeholder
    end



end
