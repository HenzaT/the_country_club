class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include RandomPhoto
  include CountryMap
  include CountrySearch

  def show
    @continent_region = params[:id]
    region_countries = Country.where(region: @continent_region)
    @countries = search_for_country(region_countries)
    respond_to do |format|
      format.html
      format.turbo_stream { render partial: "continent_region_page", locals: { countries: @countries } }
    end
    names = []
    region_countries.each do |country|
      names.push(country.name)
    end
    @random_country = names.sample

    random_unsplash_photo(region_countries)
    mapbox_markers
  end
end
