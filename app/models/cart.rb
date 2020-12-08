class Cart < ApplicationRecord
    has_many :cart_items
    #belongs_to :order <-- will enable when order model is created
end
