module CountriesHelper
  def population_index(country)
    populations = []
    countries = Country.where(continent: country.continent)
    countries.each do |c|
      populations << c.population
    end
    sorted = populations.sort.reverse
    index = sorted.find_index(country.population) + 1
    if country.population == sorted.first
      'This country has the largest population on the continent.'
    elsif country.population == sorted.last
      'This country has the smallest population on the continent.'
    elsif index.to_s.end_with?('1') && index != 1
      "This country has the #{index}st largest population on the continent."
    elsif index.to_s.end_with?('2')
      "This country has the #{index}nd largest population on the continent."
    elsif index.to_s.end_with?('3')
      "This country has the #{index}rd largest population on the continent."
    else
      "This country has the #{index}th largest population on the continent."
    end
  end

  def area_index(country)
    areas = []
    countries = Country.where(continent: country.continent)
    countries.each do |c|
      areas << c.area
    end
    sorted = areas.sort.reverse
    index = sorted.find_index(country.area) + 1
    if country.area == sorted.first
      'This country has the largest area on the continent.'
    elsif country.area == sorted.last
      'This country has the smallest area on the continent.'
    elsif index.to_s.end_with?('1') && index != 1
      "This country has the #{index}st largest area on the continent."
    elsif index.to_s.end_with?('2')
      "This country has the #{index}nd largest area on the continent."
    elsif index.to_s.end_with?('3')
      "This country has the #{index}rd largest area on the continent."
    else
      "This country has the #{index}th largest area on the continent."
    end
  end
end
