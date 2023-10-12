require 'rails_helper'

RSpec.describe Shelf, type: :model do
  it { 
    should validate_presence_of(:start_date) 
    should validate_presence_of(:quantity) 
  }  
end
