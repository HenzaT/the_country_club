module CountriesHelper
  def population_people(country)
    # for every 100000 people, add a person icon
    result = ''
    person_icon_html = content_tag(:i, '', class: 'fa-solid fa-person')
    if country.population < 1_000_000
      person_icon_html.html_safe
    else
      n_millions = country.population / 1_000_000
      n_millions.times { result += person_icon_html }
      result.html_safe
    end
  end

  def currency_convert_from_usd(country)
    currency = country.currency
    ENV['OPEN_EXCHANGE_APP_ID']
  end
end
