0.upto(10000) do |index|
  Post.where(user_id: 1,
             title: Faker::Lorem.sentence,
             url: Faker::Internet.url).first_or_create(body: (rand(2).odd? ? Faker::Lorem.paragraph : nil),
             state: "published")
end
