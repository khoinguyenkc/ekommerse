class Order < ApplicationRecord
    has_one :cart #new thing
    belongs_to :user, optional: true
    belongs_to :address, optional: true 
    accepts_nested_attributes_for :address

    def address_attributes=(address)
        #you'll be passed a hash
        self.address = Address.find_or_create_by(address) #the whole thing must match, otherwise create a new object
        self.address.user_id = current_user.id if current_user
        self.save
    end

end
