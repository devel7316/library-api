class Genre < ApplicationRecord

  #has_many :books
  validates :name, presence: true, allow_nil: false, uniqueness: true
end
