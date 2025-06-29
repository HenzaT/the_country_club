class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include RandomPhoto

  def show
    @continent_region = params[:id]
    @countries = Country.where(region: @continent_region)

    get_random_unsplash_photo

    @markers = @countries.geocoded.map do |country|
      {
        lat: country.latitude,
        lng: country.longitude,
        info_window_html: render_to_string(partial: 'shared/info_window_mapbox', locals: {country: country})
      }
    end
  end
end
