puts "creating user"
user = User.create!(
  username: "chizu",
  email: "chizu@user.com",
  password: "123456"
)

puts "done"

puts "creating categories"

category1 = Category.create!(
  name: "meals"
)

category2 = Category.create!(
  name: "desserts"
)

puts "done"

puts "creating recipes"

Recipe.create!(
  name: "Pound Cake",
  description: "Add each ingredients (from wet ingredients first) into the bowl and stir.",
  ingredients: "Eggs, cups of Milk, Flour",
  portion: "2, 1, 200",
  user: user,
  category: category2
)

Recipe.create!(
  name: "Meatball",
  description: "Add each ingredients (from wet ingredients first) into the bowl and stir.",
  ingredients: "Eggs, cups of Milk, Flour, Ground Beef",
  portion: "2, 1, 100, 300",
  user: user,
  category: category1
)

puts "done"
