namespace :ndev do

  desc "Treat resources with same faking data"
  task fake_data_create: :environment do

    puts "faking genre..."
    10.times do
      Genre.create!(
        name: Faker::Book.unique.genre
      )
    end

=begin
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
    puts "the end."
    #
    puts "faking book..."
    #Faker::Book.unique.clear
    20.times do
      itTitle = Faker::Book.unique.title 
      itGenre = Faker::Number.number(digits: 9)
      itWriter = Faker::Number.number(digits: 9)
      itQtt = Faker::Number.number(digits: 2)
      itAqs = Faker::Date.between(from: 50.years.ago, to: 2.months.ago)
      Book.create!(
        title:  itTitle,
        id_genre: itGenre,
        id_writer: itWriter,
        quantity: itQtt,
        acquisition_date: itAqs 
      )
    end
=end
    puts "the end."
  end

  task fake_data_clear: :environment do 
    puts "Genre clear!"
    #    
    Genre.destroy_all
    #Writer.destroy_all
    #Client.destroy_all
    #
    puts "the end. has to seed it..."
  end
end