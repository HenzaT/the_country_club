class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include Random_Photo

  def show
    @continent_region = params[:id]
    @countries = Country.where(region: @continent_region)
  end
end
