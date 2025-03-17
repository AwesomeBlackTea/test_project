topics = 5.times.map do
  Topic.create!(
    name: Faker::Book.genre.truncate(30)
  )
end

posts = Post.all

posts.each do |post|
  post.topics << topics.sample(rand(0..3))
end

puts 'Created topics and assigned to posts'
