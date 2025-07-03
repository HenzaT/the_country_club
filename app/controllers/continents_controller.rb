class ContinentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include RandomPhoto
  include CountryMap

  def show
    @continent = params[:id]
    @countries = Country.where(continent: @continent)

    random_unsplash_photo
    mapbox_markers
  end
end
