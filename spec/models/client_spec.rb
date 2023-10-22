require 'rails_helper'
#
RSpec.describe Client, type: :model do
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:email) }
end
