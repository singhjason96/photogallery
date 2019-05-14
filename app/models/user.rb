class User < ApplicationRecord
    has_many :albums
    validates :password, confirmation: true, length: { in: 8..32 }
    validates :email, presence: true, uniqueness: true
end
