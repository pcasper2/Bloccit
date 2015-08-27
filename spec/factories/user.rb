FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do |user|
      after(:build) do |user|
        post = create(:post, user: user)
        create(:comment, post: post, user: user)
      end
    end

  end
end