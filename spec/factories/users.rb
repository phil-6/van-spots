# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    username { Faker::LordOfTheRings.character }
    email { Faker::Internet.email }
    description { Faker::Movie.quote }
    password { 'correct horse battery staple' }
  end
end