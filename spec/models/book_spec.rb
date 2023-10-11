require 'rails_helper'

RSpec.describe Book, type: :model do
  it { 
    #should validate_length_of(:name)
    #should validate_uniqueness_of(:title) 
    should validate_presence_of(:title) 
    #  .is_at_least(3)
  }  
end
