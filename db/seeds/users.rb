10.times do
  password = Faker::Internet.password(min_length: 10)

  User.create!(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.unique.cell_phone,
    active: true,
    username: Faker::Internet.unique.username(specifier: 3..20),
    bio: Faker::Lorem.sentence(word_count: 50),
    birthday: Faker::Date.birthday(min_age: 10, max_age: 65),
    password: password,
    password_confirmation: password
  )
end

puts 'Created users'
