require 'rails_helper'

  RSpec.describe Writer, type: :model do
    it { 
      should validate_presence_of(:name) 
    }  
end
