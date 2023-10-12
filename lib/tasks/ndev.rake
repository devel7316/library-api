namespace :ndev do

  desc "Treat resources with same faking data"
  task fake_data_create: :environment do

    puts "faking genre..."
    10.times do
      Genre.create!(
        name: Faker::Book.unique.genre
      )
    end

    puts "faking writer..."
    Faker::Name.unique.clear  
    5.times do
      Writer.create!(
        name: Faker::Name.unique.name
      )
    end

    puts "faking client..."
    Faker::Name.unique.clear
    20.times do
      itName = Faker::Name.unique.name 
      itEmail = Faker::Internet.email(name: itName)
      itPhone = Faker::PhoneNumber.unique.cell_phone
      Client.create!(
        name:  itName,
        email: itEmail,
        phone: itPhone
      )
      #*puts "unique? #{itName} email:[#{itEmail}] cell:[#{itPhone}]"
    end

    puts "faking book..."
    #Faker::Book.unique.clear
    20.times do
      itTitle = Faker::Book.unique.title 
      itQtt = Faker::Number.number(digits: 2)
      itAqs = Faker::Date.between(from: 50.years.ago, to: 2.months.ago)
      #
      Book.create!(
        title:  itTitle,
        genre: Genre.all.sample,
        writer: Writer.all.sample,
        quantity: itQtt,
        acquisition_date: itAqs 
      )
    end
    
    puts "faking shelves..."
    20.times do 
      itStart = Faker::Date.between(from: 2.months.ago, to: 1.day.ago)
      #
      Shelf.create!(
        book: Book.all.sample,
        client: Client.all.sample,
        quantity: 1,
        start_date: itStart,
        end_date: '2023/09/01',
        devolution_date: '2023/09/01',
        status_id: 0
      )
    end
=begin
=end
    puts "the end."
  end

  task fake_data_clear: :environment do 
    puts "data cleanse!"
    #    
    Genre.destroy_all
    Writer.destroy_all
    Client.destroy_all
    Book.destroy_all
    Shelf.destroy_all
    #
    puts "the end. has to seed it..."
  end
end