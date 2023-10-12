class Shelf < ApplicationRecord
  #
  validates :start_date, presence: true, allow_nil: false
  validates :quantity, presence: true, allow_nil: false
  #
  belongs_to :book, required: true
  #
  belongs_to :client, required: true
end
