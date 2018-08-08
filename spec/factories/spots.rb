# spec/factories/spots.rb
FactoryBot.define do
  factory :spot do
    name { Faker::LordOfTheRings.location }
    created_by { Faker::Number.number(10) }
    description { Faker::HitchhikersGuideToTheGalaxy.quote }
    latitude { Faker::Number.decimal(4, 6) }
    longitude { Faker::Number.decimal(4, 6) }

  end
end