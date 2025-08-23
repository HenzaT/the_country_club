class ContinentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include RandomPhoto
  include CountryMap
  include CountrySearch

  def show
    @continent = params[:id]
    continent_countries = Country.where(continent: @continent)
    @countries = search_for_country(continent_countries)
    names = []
    continent_countries.each do |country|
      names.push(country.name)
    end
    @random_country = names.sample

    random_unsplash_photo(continent_countries)
    mapbox_markers
  end
end
