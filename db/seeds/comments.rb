posts = Post.all
users = User.all

30.times do
  Comment.create!(
    title: Faker::Book.title.truncate(200),
    body: Faker::Lorem.sentence,
    user: users.sample,
    post: posts.sample
  )
end

puts 'Created comments'
