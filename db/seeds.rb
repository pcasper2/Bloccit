require 'faker'

#create users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

10.times do
  topic = Topic.new(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
    )
  topic.save!
end
topics = Topic.all


#create posts
100.times do 
  post = Post.create!(
    user:  users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )

  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.create_vote
  post.update_rank
end
posts = Post.all


#create comments
100.times do
  Comment.create!(
    #user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph,
    user: users.sample
    )
end

#creating summaries for testing assignment
10.times do
  Summary.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
    )
end

#Create an admin user
admin = User.new(
  name:      'Admin User',
  email:     'admin@example.com',
  password:  'helloworld',
  role:      'admin'
  )
  admin.skip_confirmation!
  admin.save!

  #Create a moderator user
  moderator = User.new(
    name:      'Moderator User',
    email:     'moderator@example.com',
    password:  'helloworld',
    role:      'moderator'
    )
  moderator.skip_confirmation!
  moderator.save!

  #Create a member user
  member = User.new(
    name:      'Member User',
    email:     'member@example.com',
    password:  'helloworld', 
    role:      'member'
    )
  member.skip_confirmation!
  member.save!



  
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Summary.count} summaries created"
