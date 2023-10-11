class Book < ApplicationRecord
    validates :title, presence: true, allow_nil: false
    #
    #validates_presence_of :writer
    belongs_to :writer, required: true
    belongs_to :genre, required: true
    #
    validates :quantity, presence: true
    validates :acquisition_date, presence: true, allow_nil: false
end
