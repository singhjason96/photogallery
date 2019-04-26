class User < ApplicationRecord
    has_many :albums
    has_secure_password
end
