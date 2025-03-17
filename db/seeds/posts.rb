users = User.all

20.times do
  Post.create!(
    title: Faker::Book.title.truncate(200),
    body: Faker::Lorem.paragraph,
    user: users.sample
  )
end

puts 'Created posts'
