class RegionsController < ApplicationController
  def show
    @continent_region = params[:id]
    @countries = Country.where(region: @continent_region)
  end
end
