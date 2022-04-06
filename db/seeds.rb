puts "creating user"
user = User.create!(
  username: "chizu",
  email: "chizu@users.com",
  password: "123456"
)

User.new(
  username: "chika",
  email: "chika@users.com",
  password: "123456"
)

puts "done"

puts "creating categories"

category1 = Category.create!(
  name: "meals"
)
file = File.open("db/support/meal.jpg")
category1.photo.attach(io: file, filename: "meal.jpg", content_type: 'image/jpg')
category1.save!

category2 = Category.create!(
  name: "desserts"
)
file2 = File.open("db/support/dessert.jpg")
category2.photo.attach(io: file2, filename: "dessert.jpg", content_type: 'image/jpg')
category2.save!

puts "done"

puts "creating ingredients"
ingredient1 = Ingredient.create!(
  name: "wheat flour"
)

ingredient2 = Ingredient.create!(
  name: "butter"
)

puts "done"

puts "creating recipes"

recipe1 = Recipe.create!(
  name: "Pound Cake",
  description: "Recipe from Cooking.com",
  portion: "2",
  user: user,
  category: category2
)
file3 = File.open("db/support/poundcake.jpg")
recipe1.photo.attach(io: file3, filename: "poundcake.jpg", content_type: 'image/jpg')
recipe1.save!

recipe2 = Recipe.create!(
  name: "Meatball",
  description: "Recipe from my grandma",
  portion: "5",
  user: user,
  category: category1
)
file4 = File.open("db/support/meatball.jpg")
recipe2.photo.attach(io: file4, filename: "meatball.jpg", content_type: 'image/jpg')
recipe2.save!

puts "done"

puts "creating recipe ingredients"

RecipeIngredient.create!(
  quantity: 300,
  unit: "grams",
  recipe: recipe1,
  ingredient: ingredient1
)

RecipeIngredient.create!(
  quantity: 90,
  unit: "grams",
  recipe: recipe1,
  ingredient: ingredient2
)

RecipeIngredient.create!(
  quantity: 50,
  unit: "grams",
  recipe: recipe2,
  ingredient: ingredient2
)

puts "done"
