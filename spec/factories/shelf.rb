FactoryBot.define do
  factory :shelf do
    #
    book 
    client
    quantity { 1 }
    start_date { Time.now - 10.days }
    end_date { Time.now + 10.days }
    #status_id { Shelf::status_none }
  end
end  

#shelf = FactoryBotcreate(:shelf)
#puts "start:[#{shelf.start_date}]"
=begin
  id integer
  book_id integer
  client_id integer 
  quantity integer
  start_date time
  end_date time
  devolution_date time
  status_id integer
=end
