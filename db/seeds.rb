User.create!(
  username: "username",
  email: "username@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

Category.create!(:name => "Horror")
Category.create!(:name => "Action")
Category.create!(:name => "Comedy")
Category.create!(:name => "Sci-Fi")
Category.create!(:name => "Drama")
Category.create!(:name => "Fantasy")
Category.create!(:name => "Thriller")
