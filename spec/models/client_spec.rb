require 'rails_helper'
#
RSpec.describe Client, type: :model do
  it { 
    should validate_length_of(:name)
      .is_at_least(3)
  }  
  it { 
    should validate_length_of(:email)
      .is_at_least(7)
  }  
  it { 
    should validate_length_of(:phone)
      .is_at_least(7)
  }  
end
