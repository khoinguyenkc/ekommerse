class Order < ApplicationRecord
    has_one :cart #new thing
    belongs_to :user
    #belongs_to :address
end
