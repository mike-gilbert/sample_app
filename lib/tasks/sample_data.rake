namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    password  = "password"
    u = User.new(first_name: 'System',
                 last_name: 'Administrator',
                 prefix: Faker::Name.prefix,
                 suffix: Faker::Name.suffix,
                 email: 'user@example.com',
                 phone_number: Faker::PhoneNumber.cell_phone.slice(0,20),
                 password: password,
                 password_confirmation: password)
    u.account_id = 1
    u.admin = true
    u.save!
    99.times do |n|
      u = User.new(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   prefix: Faker::Name.prefix,
                   suffix: Faker::Name.suffix,
                   email: Faker::Internet.email,
                   phone_number: Faker::PhoneNumber.cell_phone.slice(0,20),
                   password: password,
                   password_confirmation: password)
      u.account_id = 1
      u.save!
    end
  end
end