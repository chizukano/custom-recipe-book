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

ingredients1 = [
  "ground beef",
  "garlic cloves",
  "ginger slices",
  "soy sauce",
  "butter",
  "salt",
  "pepper",
  "cabbage",
  "potatoes",
  "carrots",
  "corn starch",
  "lemon"
]

quantities1 = [
  200,
  2,
  5,
  5,
  30,
  0.25,
  0.25,
  0.5,
  3,
  3,
  1.5,
  0.5
]

units1 = [
  "g",
  "",
  "",
  "tsp",
  "g",
  "tbsp",
  "tbsp",
  "",
  "",
  "",
  "tbsp",
  ""
]

ingredients2 = [
  "wheat flour", "sugar", "eggs", "bananas", "chocolate", "water", "corn starch",
  "butter", "apples", "brown sugar", "coconut oil"
]

quantities2 = [
  200, 90, 3, 2, 100, 0.75, 100, 2.5, 3, 30, 2
]

units2 = [
  "g", "g", "", "", "g", "cup", "g", "tsp", "", "g", "tbsp"
]

meal_ingredients = []
dessert_ingredients = []

ingredients1.each do |ingredient|
  meal_ingredients << Ingredient.create!(
    name: ingredient
  )
end

ingredients2.each do |ingredient|
  dessert_ingredients << Ingredient.create!(
    name: ingredient
  )
end

puts "done"

puts "creating recipes"


recipe1 = Recipe.create!(
  name: "Meatball",
  description: "Recipe from my grandma",
  portion: "5",
  user: user,
  category: category1
)
file3 = File.open("db/support/meatball.jpg")
recipe1.photo.attach(io: file3, filename: "meatball.jpg", content_type: 'image/jpg')
recipe1.save!

recipe2 = Recipe.create!(
  name: "Pound Cake",
  description: "Recipe from Cooking.com",
  portion: "2",
  user: user,
  category: category2
)
file4 = File.open("db/support/poundcake.jpg")
recipe2.photo.attach(io: file4, filename: "poundcake.jpg", content_type: 'image/jpg')
recipe2.save!

puts "done"

puts "creating recipe ingredients"

recipe_ingredients1 = []
index = 0

meal_ingredients.each do |ingredient|
  RecipeIngredient.create!(
    quantity: quantities1[(index += 1) % quantities1.size],
    unit: units1[(index += 1) % units1.size],
    recipe: recipe1,
    ingredient: ingredient
  )
end

recipe_ingredients2 = []

dessert_ingredients.each do |ingredient|
  RecipeIngredient.create!(
    quantity: quantities2[(index += 1) % quantities2.size],
    unit: units2[(index += 1) % units2.size],
    recipe: recipe2,
    ingredient: ingredient
  )
end

puts "done"
