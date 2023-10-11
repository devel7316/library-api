FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    writer 
    genre
    quantity { 0 }
    acquisition_date { '2020/12/30' }
  end
end  

