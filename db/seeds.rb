50.times do
  User.create(
              { user_name: Faker::Internet.user_name,
                email: Faker::Internet.email }
              )
end

50.times do
  Question.create(
              { title: Faker::Company.bs,
                body: Faker::Company.catch_phrase,
                user_id: rand(1..50) }
              )
end


50.times do
  Answer.create(
              { body: Faker::ChuckNorris.fact,
                user_id: rand(1..50),
                question_id: rand(1..50) }
              )
end

250.times do
  Comment.create(
              { body: Faker::Company.profession,
                user_id: rand(1..50),
                commentable_id: rand(1..50),
                commentable_type: ["Question", "Answer"].sample }
              )
end

250.times do
  Vote.create(
          { voteable_id: rand(1..50),
            voteable_type: ["Question", "Answer", "Comment"].sample,
            upvote: [false, true].sample,
            user_id: rand(1..50) }
          )
end


