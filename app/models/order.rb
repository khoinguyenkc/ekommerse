class Order < ApplicationRecord
    has_one :cart #new thing
    belongs_to :user, optional: true
    belongs_to :address
end
