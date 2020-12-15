class Cart < ApplicationRecord
    has_many :cart_items
    has_many :products, through: :cart_items
    belongs_to :order, optional: true

    def unique_products
        self.products.uniq
        #this method is perfectly fine. its more user friendly!
    end


    def unique_product_tally(product_id)
        #we dont need this. but user wants to see it
        tally = 0
        self.cart_items.each do | cart_item |
            if cart_item.product_id == product_id
                #assuming cart_item.amount is already there. otherwise will cause errors
                tally += cart_item.quantity 
            end
        end

        tally #return
    end


    def unique_product_amount(product_id)
        #@product = Product.find_by(id: product_id)
        amount = 0

        self.cart_items.each do | cart_item |
            if cart_item.product_id == product_id
                #assuming cart_item.amount is already there. otherwise will cause errors
                amount += cart_item.amount 
            end
        end

        amount #return
    end



end
