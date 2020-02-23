# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url1 = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

response = open(url1).read
cocktails = JSON.parse(response)
drinks = cocktails['drinks']

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

url = 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'
Cocktail.create!(name: 'Long Island Iced Tea', url: url)

drinks.each do |d|
  name = d['strIngredient1']
  Ingredient.create!(name: name)
end

Dose.create!(description: '3/4', ingredient_id: Ingredient.first.id, cocktail_id: Cocktail.first.id)
