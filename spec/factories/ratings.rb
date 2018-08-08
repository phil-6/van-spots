# spec/factories/ratings.rb
FactoryBot.define do
  factory :rating do
    score { Faker::Number.between(0, 100) }
    created_by { Faker::Number.number(10) }
    review_title { Faker::Food.dish }
    review_body { Faker::Movie.quote }

    spot_id 1
  end
end