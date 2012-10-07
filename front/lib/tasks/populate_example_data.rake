namespace :populate_example_data do
  desc "populates the db with some users and transactions"
  task :test => :environment do
    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    DatabaseCleaner.clean
    
    rand(5..20).times do
      user = User.create!({
        email: Faker::Internet.email,
        password: "secret",
        password_confirmation: "secret"
      })
      categories = user.categories
      rand(1..4).times do
        account = user.accounts.create!({
          name: Faker::Lorem.sentence(rand(1..3)),
          initial_balance: rand(-200_000..400_000),
        })
      end
      user.accounts.each do |account|
        rand(50..150).times do
          account.transactions.create!({
            name: Faker::Name.name,
            amount: rand(-1_000_000..1_000_000),
            category_id: categories.sample.id,
            description: Faker::Lorem.sentence(rand(7)),
            creation: rand(1.year).ago
          })
        end
      end
    end

  end
  
end
