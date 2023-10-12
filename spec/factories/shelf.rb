FactoryBot.define do
  factory :shelf do
    #
    start_date { '2020/12/30' }
    quantity { 1 }
    book 
    client
  end
end  

