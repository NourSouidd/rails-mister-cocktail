# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

response = open(url).read
cocktails = JSON.parse(response)
drinks = cocktails['drinks']

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

Cocktail.create!(name: 'Long Island Iced Tea')

drinks.each do |d|
  name = d['strIngredient1']
  Ingredient.create!(name: name)
end

Dose.create!(description: '3/4', ingredient_id: Ingredient.first.id, cocktail_id: Cocktail.first.id)
