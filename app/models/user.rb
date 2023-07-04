class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6, maximum: 12 }
    has_many :postare
end
