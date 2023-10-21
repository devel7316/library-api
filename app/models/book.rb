class Book < ApplicationRecord
=begin  
    # Required dependency for ActiveModel::Errors
  extend ActiveModel::Naming

  def initialize()
    #@errors = ActiveModel::Errors.new(self)
  end
=end

    validates :title, allow_nil: false, uniqueness: true
    #
    belongs_to :writer, required: true
    belongs_to :genre, required: true
    #
    validates :quantity, presence: true
    validates :acquisition_date, presence: true, allow_nil: false
    #
    has_many :shelf


=begin
    #def error()
    #def error(:name name, message: message)
        
        #@errors.add(:name name, message: message)
    #end
    # The following methods are needed to be minimally implemented

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def self.human_attribute_name(attr, options = {})
    attr
  end

  def self.lookup_ancestors
    [self]
  end
=end  
end
