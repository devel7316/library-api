FactoryBot.define do
    factory :writer do
      name { Faker::Name.unique.name }  
    end
  end
  