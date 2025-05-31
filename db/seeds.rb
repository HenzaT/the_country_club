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
User.destroy_all
Wishlist.destroy_all
Favourite.destroy_all

# separate urls for each region
africa_url = 'https://restcountries.com/v3.1/region/africa'
america_url = 'https://restcountries.com/v3.1/region/america'
asia_url = 'https://restcountries.com/v3.1/region/asia'
europe_url = 'https://restcountries.com/v3.1/region/europe'
oceania_url = 'https://restcountries.com/v3.1/region/oceania'

# array of urls
urls = [africa_url, america_url, asia_url, europe_url, oceania_url]

# iterate over the urls array, parse and create country
urls.each do |url|
  countries_json = URI.parse(url).read
  countries = JSON.parse(countries_json)

  countries.each do |country|
    puts 'creating country...'
    country_name = country['name']['common']
    currency_hash = country['currencies'].values[0] || 'None'
    currency = currency_hash.values[1] || 'None'
    capital = country['capital']&.first || 'None'
    language_one = country['languages'].values[0]
    language_two = country['languages'].values[1] || 'None'
    language_three = country['languages'].values[2] || 'None'
    continent = country['region']
    region = country['subregion'] || 'None'
    flag = country['flags']['png']
    timezone = country['timezones']&.first
    population = country['population']
    latitude = country['latlng']&.first
    longitude = country['latlng']&.last

    Country.create!(
      name: country_name,
      currency: currency,
      capital: capital,
      language_one: language_one,
      language_two: language_two,
      language_three: language_three,
      continent: continent,
      region: region,
      flag: flag,
      timezone: timezone,
      population: population,
      latitude: latitude,
      longitude: longitude
    )
  end
end

User.create!(email: 'henry@henry.com', password: 'gkjasfnjk')
User.create!(email: 'james@james.com', password: 'khjabdf')

Wishlist.create!(desire_rating: 2, country_id: 143, user_id: 1)
Wishlist.create!(desire_rating: 2, country_id: 143, user_id: 2)

Favourite.create!(visit_date: '2025-04-30', rating: 2, times_visited: 4, country_id: 1, user_id: 1)
Favourite.create!(visit_date: '2025-04-23', rating: 2, times_visited: 4, country_id: 1, user_id: 2)


puts "finished! created #{Country.count} countries, #{Wishlist.count} wishlists and #{Favourite.count} favourites!"
