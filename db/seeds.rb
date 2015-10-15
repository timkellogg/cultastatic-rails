User.create!(
  username: "username",
  email: "username@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

# 20.times do |n|
#   Category.create!(
#     name: %w[j k i e r e z n a x y q u o p z y e].sample(10).join("")
#   )
#   5.times do |movie|
#     Movie.create(
#       :title => Faker::Name.name,
#       :director => Faker::Name.name,
#       :release => Faker::Date.backward,
#       :runtime => rand(60..180),
#       :summary => Faker::Lorem.paragraph(3),
#       :picture =>  Faker::Avatar.image("50x50"),
#       :actors => Faker::Lorem.words(4),
#       :category_id => Category.last.id
#
#       )
#   end
# end

Category.create!(:name => "Horror")
Category.create!(:name => "Action")
Category.create!(:name => "Comedy")
Category.create!(:name => " Sci-Fi")
Category.create!(:name => " Drama")
Category.create!(:name => "Fantasy")
Category.create!(:name => "Thriller")
