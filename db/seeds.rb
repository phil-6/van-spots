# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed 50 records
50.times do
  spot = Spot.create(
      name: Faker::LordOfTheRings.location,
      created_by: Faker::Number.number(10),
      description: Faker::HitchhikersGuideToTheGalaxy.quote,
      latitude: Faker::Number.decimal(4, 6),
      longitude:  Faker::Number.decimal(4, 6))
  puts("Van Spot Created")

  3.times do
    spot.ratings.create(
        score: Faker::Number.between(0, 100),
        created_by: Faker::Number.number(10),
        review_title: Faker::Food.dish,
        review_body: Faker::Movie.quote,
        spot_id: Faker::Number.between(1, 50) )
    puts("Spot Rating Created")
  end
end


1.times do
user = User.create(
               username: "test",
               email: "test@email.com",
               description: "I am test",
               password: "testpass"
)
end