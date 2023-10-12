FactoryBot.define do
  factory :client do
    itName = Faker::Name.unique.name  
    name { itName }
    email { Faker::Internet.email(name: itName) }
    phone { Faker::PhoneNumber.unique.cell_phone }
  end
end
