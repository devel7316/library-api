class Client < ApplicationRecord
    
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    #
    has_many :shelf
end
