class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include RandomPhoto
  include CountryMap

  def show
    @continent_region = params[:id]
    @countries = Country.where(region: @continent_region)

    get_random_unsplash_photo
    mapbox_markers
  end
end
