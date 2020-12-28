class Order < ApplicationRecord
    has_one :cart #new thing
    belongs_to :user, optional: true
    belongs_to :address, optional: true 
    accepts_nested_attributes_for :address

    def address_attributes=(address)
        #you'll be passed a hash
        self.address = Address.find_or_create_by(address) #the whole thing must match, otherwise create a new object
        #we can't save user id using current_user or session becuase models dont get access to it. must be fed or something.
        self.save
    end

    def compute_total_so_far(cart)
        #will build this later...
        sum = 0
        sum += cart.coupon if cart.coupon
        sum += cart.subtotal if cart.coupon
        sum += cart.shipping if cart.shipping
        sum += cart.taxes if cart.taxes
        #binding.pry
        self.total_amount = sum
        self.save
        self.total_amount
    end





end
