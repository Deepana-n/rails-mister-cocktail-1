require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])

end

url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)

cocktails["drinks"].each do |cocktail|
  Cocktail.create(name: cocktail["strDrink"])
end





# dose1 = Dose.create(description: "5cl de gin", ingredient_id: 1, cocktail_id: 1)
# dose2 = Dose.create(description: "15cl de vodka", ingredient_id: 2, cocktail_id: 2)
# dose3 = Dose.create(description: "25cl de rhum", ingredient_id: 3, cocktail_id: 3)

# get id en string
# url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
# drinks_serialized = open(url).read
# drinks = JSON.parse(drinks_serialized)
# ids = []

# # stocker chaque id dans array
# drinks["drinks"].each do |cocktail|
#   ids << cocktail["idDrink"].to_i
# end

#parser avec un lien qui change en fonction id
# 50.times do
# id = ids[rand(ids.length)]

# url = "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"
# cocktails_serialized = open(url).read
# cocktails = JSON.parse(cocktails_serialized)

# p cocktails["drinks"]
# p cocktails["drinks"].size

# cocktails["drinks"].each do |cocktail|
#   a = Dose.new(description: cocktail["strInstructions"], ingredient_id: rand(270), cocktail_id: rand(250))
#   p a
#   a.save
# end
