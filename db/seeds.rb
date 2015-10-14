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
end

User.create!(
 username: "a1l33n",
 email: "acacayorin@gmail.com",
 password: "notreal!",
 password_confirmation: "notreal!"
)

User.create!(
  username: "tkellogg",
  email: "tim.kellogg@gmail.com",
  password: "password",
  password_confirmation: "password"
)
