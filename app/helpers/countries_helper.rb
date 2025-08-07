module CountriesHelper
  # def population_people(country)
  #   # for every 100000 people, add a person icon
  #   result = ''
  #   person_icon_million_html = content_tag(:i, '', class: 'fa-solid fa-person')
  #   person_icon_ten_million_html = content_tag(:i, '', class: 'fa-solid fa-person fa-2x')
  #   if country.population < 1_000_000
  #     person_icon_million_html.html_safe
  #   else
  #     n_ten_millions = country.population / 10_000_000
  #     n_millions = country.population / 1_000_000
  #     n_ten_millions.times { result += person_icon_ten_million_html }
  #     n_millions.times { result += person_icon_million_html }
  #     result.html_safe
  #   end
  # end
end
