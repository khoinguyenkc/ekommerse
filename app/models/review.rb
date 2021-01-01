class Review < ApplicationRecord
    belongs_to :user
    belongs_to :product

    validates :content, presence: true

    # scope :new_to_old, -> { order(created_at: :desc) }
    scope :new_to_old, -> { order("created_at DESC") }
    #not ordering right for some reason. even though no errors

end


