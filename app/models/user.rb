class User < ApplicationRecord
    has_secure_password
    has_many :addresses
    has_many :orders
    has_many :reviews

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /.{1,}@[^.]{1,}/ , message: "Your entered an invalid email" }

    validates :password, length: { in: 6..20 }

end
