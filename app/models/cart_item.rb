class CartItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart, optional: true

    def compute_price
        if !self.price
        #do not mess around with these. if current price change, it will affect the price
        @product = Product.find_by(id: product_id)
        self.price = @product.current_price
        end
    end

    def compute_amount
        self.amount = price * quantity if !self.amount
    end
end
