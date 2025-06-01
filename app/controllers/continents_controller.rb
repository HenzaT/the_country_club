class ContinentsController < ApplicationController
  def show
    @continent = params[:id]
    @countries = Country.where(continent: @continent)
  end
end
