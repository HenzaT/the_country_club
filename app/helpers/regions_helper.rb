module RegionsHelper
  def sort_alphabetically(countries)
    names = []
    countries.each do |country|
      names << country.name
    end
    names.sort
  end
end
