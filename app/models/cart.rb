class Cart < ApplicationRecord
    has_many :cart_items
    has_many :products, through: :cart_items
    belongs_to :order, optional: true

    def unique_products
        self.products.uniq
        #this method is perfectly fine. its more user friendly!
    end

    def price_when_bought(product)
        cart_item = self.cart_items.find { |x| x.product_id == product.id }
        #binding.pry
        cart_item.price 
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

    def compute_current_subtotal
        #we expect this used multiple times. when we 
        sum = 0
        self.cart_items.each do | cart_item |
            sum += cart_item.amount
        end
        self.subtotal = sum
        self.save #otherwise this wont save
        self.subtotal
    end

    def compute_taxes(zipcode, subtotal)
        #an arbitrary formula, implicit return
        self.taxes = zipcode < 50000 ? (subtotal * 0.05) : (subtotal * 0.0875) 
        self.save
        self.taxes
    end

    def compute_shipping_options
        #3 options: fast shipping, slow shipping, free shipping(if qualifies)
        #ideally we implement a variable where we store our freeshippingthreshold
        #heres a fake algorithm

        #assumption: metod called after compute_current_subtotal
        hash = {
            free: 0.00,
            slow: subtotal > 50 ? 0.00 : 4.65,
            fast: 8.00
        }
    end







        



end
