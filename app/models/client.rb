class Client < ApplicationRecord
    
    validates :name, presence: true, allow_nil: false, uniqueness: true
    validates :email, presence: true, allow_nil: false, uniqueness: true
    #
    has_many :shelf
end
