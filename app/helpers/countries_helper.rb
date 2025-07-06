module CountriesHelper
  def population_people(country)
    case
    when country.population <= 100
      '100'
    when country.population <= 500
      '500'
    when country.population <= 1000
      '1000'
    when country.population <= 5000
      '5000'
    when country.population <= 10000
      '10000'
    when country.population <= 100000
      '100000'
    when country.population <= 1000000
      '1000000'
    when country.population <= 10000000
      '10000000'
    when country.population <= 100000000
      '100000000'
    else
      "that's more"
    end
  end
end
