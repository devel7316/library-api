class Client < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3 }
    validates :email, presence: true, length: { minimum: 7 }
    validates :phone, presence: true, length: { minimum: 7 }
end
