class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  
  def show
    @continent_region = params[:id]
    @countries = Country.where(region: @continent_region)
  end
end
