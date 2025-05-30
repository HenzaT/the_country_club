# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'

puts 'cleaning database...'
Country.destroy_all

url = 'https://restcountries.com/v3.1/name/deutschland'

countries_json = URI.parse(url).read
countries = JSON.parse(countries_json)

countries.each do |country|
  puts 'creating country...'
  currency_hash = country['currencies'].values[0]
  Country.create!(
    name: country['name'].values[0],
    currency: currency_hash.values[1],
    capital: country['capital'][0],
    language_one: country['languages'].values[0],
    continent: country['region'],
    region: country['subregion'],
    flag: country['flags'].values[0],
    timezone: country['timezones'][0],
    population: country['population'],
    latitude: country['latlng'][0],
    longitude: country['latlng'][1]
  )
end

puts "finished! created #{Country.count} countries!"
