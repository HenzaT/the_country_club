# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'json'
require 'open-uri'
require 'httparty'
# require 'httparty'

puts '----- cleaning database -----'
CountryPhoto.destroy_all
Country.destroy_all
User.destroy_all
# CountryPhoto.destroy_all
Wishlist.destroy_all
Favourite.destroy_all
puts '----- database clear! -----'

# base rate is GBP = 1
currency_hash = {
  'AED' => 4.950348,
  'AFN' => 84.920882,
  'ALL' => 110.238541,
  'AMD' => 506.331497,
  'ANG' => 2.412831,
  'AOA' => 1236.070616,
  'ARS' => 1870.153275,
  'AUD' => 1.904154,
  'AWG' => 2.426311,
  'AZN' => 2.291516,
  'BAM' => 2.235402,
  'BBD' => 2.695901,
  'BDT' => 164.357741,
  'BGN' => 2.237652,
  'BHD' => 0.507932,
  'BIF' => 3988.464351,
  'BMD' => 1.347951,
  'BND' => 1.706783,
  'BOB' => 9.293412,
  'BRL' => 6.978812,
  'BSD' => 1.347951,
  'BTC' => 0.00002,
  'BTN' => 122.311642,
  'BWP' => 17.808468,
  'BYN' => 3.856691,
  'BZD' => 2.704931,
  'CAD' => 1.845007,
  'CDF' => 3107.49994,
  'CHF' => 1.0455,
  'CLF' => 0.029594,
  'CLP' => 1168.538296,
  'CNH' => 9.299901,
  'CNY' => 9.312653,
  'COP' => 4973.592773,
  'CRC' => 643.414111,
  'CUC' => 1.347951,
  'CUP' => 34.709726,
  'CVE' => 126.028527,
  'CZK' => 27.712515,
  'DJF' => 239.507464,
  'DKK' => 8.546276,
  'DOP' => 82.670333,
  'DZD' => 175.213848,
  'EGP' => 64.072082,
  'ERN' => 20.219258,
  'ETB' => 209.301537,
  'EUR' => 1.144124,
  'FJD' => 2.972433,
  'FKP' => 1.0,
  'GBP' => 1.0,
  'GEL' => 3.605768,
  'GGP' => 1.0,
  'GHS' => 14.827456,
  'GIP' => 1.0,
  'GMD' => 99.074366,
  'GNF' => 11799.794942,
  'GTQ' => 10.31979,
  'GYD' => 281.339728,
  'HKD' => 10.535109,
  'HNL' => 35.581505,
  'HRK' => 8.620184,
  'HTG' => 176.2902,
  'HUF' => 434.930806,
  'IDR' => 22730.354632,
  'ILS' => 4.199695,
  'IMP' => 1.0,
  'INR' => 122.295304,
  'IQD' => 1761.989996,
  'IRR' => 56729.845107,
  'ISK' => 165.784433,
  'JEP' => 1.0,
  'JMD' => 209.561789,
  'JOD' => 0.955697,
  'JPY' => 208.898588,
  'KES' => 173.364266,
  'KGS' => 117.878272,
  'KHR' => 5408.489709,
  'KMF' => 563.443689,
  'KPW' => 1213.155458,
  'KRW' => 1948.118733,
  'KWD' => 0.413089,
  'KYD' => 1.120787,
  'KZT' => 665.051387,
  'LAK' => 28820.176852,
  'LBP' => 120423.383635,
  'LKR' => 416.129066,
  'LRD' => 249.53938,
  'LSL' => 21.667559,
  'LYD' => 8.508199,
  'MAD' => 12.33243,
  'MDL' => 23.099233,
  'MGA' => 5829.88595,
  'MKD' => 70.457804,
  'MMK' => 2830.561273,
  'MNT' => 4810.835365,
  'MOP' => 10.826807,
  'MRU' => 53.851729,
  'MUR' => 62.571864,
  'MVR' => 20.765178,
  'MWK' => 2332.207602,
  'MXN' => 23.094032,
  'MYR' => 5.261051,
  'MZN' => 86.140769,
  'NAD' => 21.667559,
  'NGN' => 1809.762037,
  'NIO' => 49.490189,
  'NOK' => 12.839363,
  'NPR' => 195.698786,
  'NZD' => 2.254664,
  'OMR' => 0.518116,
  'PAB' => 1.347951,
  'PEN' => 4.51778,
  'PGK' => 5.865674,
  'PHP' => 78.123838,
  'PKR' => 375.879929,
  'PLN' => 4.814492,
  'PYG' => 8716.225069,
  'QAR' => 4.902272,
  'RON' => 5.831369,
  'RSD' => 134.278786,
  'RUB' => 103.355762,
  'RWF' => 1964.291184,
  'SAR' => 5.056819,
  'SBD' => 10.844507,
  'SCR' => 17.710976,
  'SDG' => 810.792231,
  'SEK' => 12.212701,
  'SGD' => 1.706505,
  'SHP' => 1.0,
  'SLE' => 32.991089,
  'SLL' => 28265.848191,
  'SOS' => 767.269401,
  'SRD' => 50.730791,
  'SSP' => 175.584033,
  'STD' => 30034.763644,
  'STN' => 28.002533,
  'SVC' => 11.767922,
  'SYP' => 17526.052513,
  'SZL' => 21.660245,
  'THB' => 41.916934,
  'TJS' => 12.743439,
  'TMT' => 4.717827,
  'TND' => 3.904925,
  'TOP' => 3.245541,
  'TRY' => 59.080675,
  'TTD' => 9.125346,
  'TWD' => 42.513685,
  'TZS' => 3477.712312,
  'UAH' => 58.214185,
  'UGX' => 4847.375992,
  'USD' => 1.347951,
  'UYU' => 52.265087,
  'UZS' => 16425.489673,
  'VES' => 536.817726,
  'VND' => 35006.27471,
  'VUV' => 161.747321,
  'WST' => 3.674904,
  'XAF' => 750.496615,
  'XAG' => 0.016144,
  'XAU' => 0.000264,
  'XCD' => 3.642904,
  'XCG' => 2.423991,
  'XDR' => 0.932427,
  'XOF' => 750.496615,
  'XPD' => 0.000795,
  'XPF' => 136.530396,
  'XPT' => 0.000666,
  'YER' => 321.418812,
  'ZAR' => 21.620978,
  'ZMW' => 25.466303,
  'ZWG' => 34.735202,
  'ZWL' => 434.040064
}

created_rates = {}

currency_hash.each do |code, rate_value|
  puts '----- creating currency rates -----'
  created_rates[code] = CurrencyRate.find_or_create_by!(
    code: code,
    rate: rate_value
  )
end

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
    puts "----- creating #{country['name']['common']} -----"
    country_name = country['name']['common']
    currency_hash = country['currencies'].values[0] || 'None'
    currency = currency_hash.values[1] || 'None'
    currency_symbol = currency_hash.values[0] || 'None'
    currency_code = country['currencies']&.keys&.find { |code| created_rates.key?(code) } || 'USD'
    matching_rate = created_rates[currency_code]
    capital = country['capital']&.first || 'None'
    capital_coordinates = country['capitalInfo'].values[0] || 'None'
    capital_latitude = capital_coordinates[0] || 'None'
    capital_longitude = capital_coordinates[1] || 'None'
    language_one = country['languages'].values[0]
    language_two = country['languages'].values[1] || 'None'
    language_three = country['languages'].values[2] || 'None'
    continent = country['region']
    region = country['subregion'] || 'None'
    flag = country['flags']['png']
    flag_alt = country['flags']['alt'] || 'None'
    timezone = country['timezones']&.first
    area = country['area'] || 'None'
    population = country['population']
    latitude = country['latlng']&.first
    longitude = country['latlng']&.last

    Country.create!(
      name: country_name,
      currency: currency,
      currency_code: currency_code,
      currency_symbol: currency_symbol,
      capital: capital,
      capital_latitude: capital_latitude,
      capital_longitude: capital_longitude,
      language_one: language_one,
      language_two: language_two,
      language_three: language_three,
      continent: continent,
      region: region,
      flag: flag,
      flag_alt: flag_alt,
      timezone: timezone,
      area: area,
      population: population,
      latitude: latitude,
      longitude: longitude,
      currency_rate_id: matching_rate&.id
    )
  end
end

countries = Country.all

# fetch api key from secret
api_key = ENV.fetch('UNSPLASH_ACCESS_KEY')
# instantiate new UnsplashApi with key
api = UnsplashApi.new(api_key)

countries.each do |country|
  puts "----- fetching Unsplash photo data for #{country.name} -----"

  response = api.image_by_country(country.name)
  photo = response['results'].first

  if photo.present?
    CountryPhoto.create!(
      image_url: photo['urls']['raw'],
      image_alt: photo['alt_description'] || "Photo of #{country.name}",
      photographer_name: photo['user']['name'],
      photographer_url: photo['user']['links']['html'],
      image_page_url: photo['links']['html'],
      country_id: country.id
    )
  else
    puts "----- no photo found for #{country.name}, skipping -----"
  end
end

puts '----- created a photo for each country! -----'

User.create!(email: 'tester@example.com', password: 'SillyPoliteNapkin24', first_name: 'Tess')
User.create!(email: 'james@example.com', password: 'GreaterJobsHarrow90', first_name: 'Jimmy')

puts '----- created two users! -----'

puts "----- finished! created #{Country.count} countries! -----"
