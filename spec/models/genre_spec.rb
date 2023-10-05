require 'rails_helper'

RSpec.describe Genre, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe ' Model.Genre' do 
    let(:genre1){ FactoryBot.create :genre }

    context 'validates field using factoryBot' do 
      it 'name must be valid' do
        expect(genre1).to be_valid 
      end
      #
    end
  end  
end
