User.create!(
  username: "username",
  email: "username@gmail.com",
  password: "password",
  password_confirmation: "password"
)

20.times do |n|
  Category.create!(
    name: %w[j k i e r e z n a x y q u o p z y e].sample(10).join("")
  )
  5.times do |movie|
    Movie.create(
      :title => Faker::Name.name,
      :director => Faker::Name.name,
      :release => Faker::Date.backward,
      :runtime => rand(60..180),
      :summary => Faker::Lorem.paragraph(3),
      :picture =>  Faker::Avatar.image("50x50"),
      :actors => Faker::Lorem.words(4),
      :category_id => Category.last.id

      )
  end
end

User.create!(
 username: "a1l33n",
 email: "acacayorin@gmail.com",
 password: "notreal!",
 password_confirmation: "notreal!",
 admin: true
)

User.create!(
  username: "tkellogg",
  email: "tim.kellogg@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)
