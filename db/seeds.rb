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
# file = File.open("db/support/meal.jpg")
# category1.photo.attach(io: file, filename: "meal.jpg", content_type: 'image/jpg')
# category1.save!

category2 = Category.create!(
  name: "desserts"
)
# file2 = File.open("db/support/meal.jpg")
# category2.photo.attach(io: file2, filename: "dessert.jpg", content_type: 'image/jpg')
# category2.save!

puts "done"

puts "creating recipes"

recipe1 = Recipe.create!(
  name: "Pound Cake",
  description: "Add each ingredients (from wet ingredients first) into the bowl and stir.",
  ingredients: "Eggs, cups of Milk, Flour",
  portion: "2, 1, 200",
  user: user,
  category: category2
)
# file3 = File.open("db/support/poundcake.jpg")
# recipe1.photo.attach(io: file3, filename: "poundcake.jpg", content_type: 'image/jpg')
# recipe1.save!

recipe2 = Recipe.create!(
  name: "Meatball",
  description: "Add each ingredients (from wet ingredients first) into the bowl and stir.",
  ingredients: "Eggs, cups of Milk, Flour, Ground Beef",
  portion: "2, 1, 100, 300",
  user: user,
  category: category1
)
# file3 = File.open("db/support/meatball.jpg")
# recipe2.photo.attach(io: file4, filename: "meatball.jpg", content_type: 'image/jpg')
# recipe2.save!

puts "done"
