require 'rails_helper'

  RSpec.describe Writer, type: :model do
    it { 
      should validate_length_of(:name)
        .is_at_least(3)
    }  
end
