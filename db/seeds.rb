



100.times do

first_name = Faker::Name.first_name
last_name = Faker::Name.last_name



entry = Entry.new(
                  fn: first_name,
                  ln: last_name,
                  email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
                  p_num: Faker::PhoneNumber.phone_number
                  )
entry.save
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
