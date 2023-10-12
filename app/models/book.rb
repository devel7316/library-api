class Book < ApplicationRecord
    validates :title, presence: true, allow_nil: false
    #
    #validates_presence_of :writer
    belongs_to :genre, required: true
    belongs_to :writer, required: true
    #
    validates :quantity, presence: true
    validates :acquisition_date, presence: true, allow_nil: false
    #
    has_many :shelf
end
