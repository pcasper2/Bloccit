require 'faker'

#create posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end
posts = Post.all


#create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

#creating a post after all the other posts
#it should only be created once

if Post.exists?(:title => "Blackhawks!!!") == false
    my_post = Post.create!(
      title: "Blackhawks!!!",
      body: "They are about to win the Stanley Cup!"
      )
end

#creating a comment to attach to my blackhawks post
#actually coded this during the final seconds of 
#the Stanley Cup final.

if Comment.exists?(:post => my_post) == false
  my_comment = Comment.create!(
    post: my_post,
    body: "They actually won it! 2-0 over the TB Lightning! 3 cups in 6 years, baby!"
    )
end


#tested to see that i only inputed once
if Post.exists?(:title => "Blackhawks!!!")
  puts "hey i made my own post only once"
end

  
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"