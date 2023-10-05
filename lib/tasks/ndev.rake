namespace :ndev do
  desc "Treat resources with same faking data"
  task fake_data_create: :environment do
    
    puts "faking genre..."
    10.times do
      Genre.create!(
        name: Faker::Book.genre
      )
    end
    puts "the end."
  end

  task fake_data_clear: :environment do 
    puts "Genre clear!"
    Genre.destroy_all
  end
end