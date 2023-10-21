class Shelf < ApplicationRecord

  belongs_to :book, required: true
  belongs_to :client, required: true
  #
  validates :quantity, presence: true, allow_nil: false
  validates :start_date, presence: true, allow_nil: false
  validates :end_date, presence: true, allow_nil: false
  #
  enum :status, { none: 0, out: 1 }, prefix: true
end

=begin
  id integer
  book_id integer
  client_id integer 
  quantity integer
  start_date time
  end_date time
  devolution_date time
  status_id integer
=end