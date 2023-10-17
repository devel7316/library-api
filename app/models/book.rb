class Book < ApplicationRecord
    #
    validates :title, allow_nil: false, uniqueness: true
    #
    belongs_to :writer, required: true
    belongs_to :genre, required: true
    #
    validates :quantity, presence: true
    validates :acquisition_date, presence: true, allow_nil: false
    #
    has_many :shelf
end
