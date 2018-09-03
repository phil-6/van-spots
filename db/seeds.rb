# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# User.create(
#     username: "test",
#     email: "test@email.com",
#     description: "I am test",
#     password: "testpass"
# )


# # FOR DEVELOPMENT
# seed 50 spots and 150 ratings
# 50.times do
#   spot = Spot.create(
#       name: Faker::LordOfTheRings.location,
#       created_by: Faker::Number.number(10),
#       description: Faker::HitchhikersGuideToTheGalaxy.quote,
#       latitude: Faker::Number.decimal(4, 6),
#       longitude:  Faker::Number.decimal(4, 6))
#   puts("Van Spot Created")
#
#   3.times do
#     spot.ratings.create(
#         score: Faker::Number.between(0, 100),
#         created_by: Faker::Number.number(10),
#         review_title: Faker::Food.dish,
#         review_body: Faker::Movie.quote,
#         spot_id: Faker::Number.between(1, 50) )
#     puts("Spot Rating Created")
#   end
# end



# # FOR PRODUCTION TESTING

Spot.create(
    name: 'Penrice, Gower',
    created_by: 1,
    description: 'Quiet spot, Internet\'s not the best but with an antenna it\'s ok. Hunts on the weekends meet here, can get pretty hectic, stayed there all day and no complaints. It\'s silent at night apart from the wildlife.',
    latitude: 51.57297,
    longitude: -4.17569
)

Spot.create(
    name: 'Penclawdd',
    created_by: 1,
    description: 'Beautiful spot and quiet. Good Internet... watch out for high tides! Got woken up by a bus driver at 7am with my wheels under water and the tide still coming in, I left pretty sharpish but it didn\'t really come in any more.',
    latitude: 51.6412,
    longitude: -4.12187
)

Spot.create(
    name: 'Cefn Bryn, Gower',
    created_by: 1,
    description: 'Good place to stay, usually some other campers there too... watch out for cows using your van as a scratching post.',
    latitude: 51.58892,
    longitude: -4.17995
)

Spot.create(
    name: 'Mountain Road',
    created_by: 1,
    description: 'Awesome \n\n Layby, amazing views, warden has seen me and not said anything, stayed there several times.',
    latitude: 51.8578,
    longitude: -3.85222
)

Spot.create(
    name: 'Lay-by near Llangrannog',
    created_by: 1,
    description: 'Quiet lay by up the hill. MWB and SWB only as turning up the hill is a touch tight...',
    latitude: 52.15372,
    longitude: -4.47397
)


