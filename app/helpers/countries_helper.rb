module CountriesHelper
  def population_index(country)
    populations = Country.where(continent: country.continent).map(&:population).sort.reverse
    index = populations.find_index(country.population) + 1
    if country.population == populations.first
      'Largest population'
    elsif country.population == populations.last
      'Smallest population'
    elsif index.to_s.end_with?('1') && index != 1 || index != 11
      "#{index}st largest"
    elsif index.to_s.end_with?('2')
      "#{index}nd largest"
    elsif index.to_s.end_with?('3')
      "#{index}rd largest"
    else
      "#{index}th largest"
    end
  end

  def area_index(country)
    areas = Country.where(continent: country.continent).map(&:area).sort.reverse
    index = areas.find_index(country.area) + 1
    if country.area == areas.first
      'Largest area'
    elsif country.area == areas.last
      'Smallest area'
    elsif index.to_s.end_with?('1') && index != 1
      "#{index}st largest"
    elsif index.to_s.end_with?('2')
      "#{index}nd largest"
    elsif index.to_s.end_with?('3')
      "#{index}rd largest"
    else
      "#{index}th largest"
    end
  end
end
