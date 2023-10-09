FactoryBot.define do
  factory :genre do
    name { Faker::Book.unqiue.genre }  
  end
end
