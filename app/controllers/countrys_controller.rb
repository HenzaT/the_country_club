class CountrysController < ApplicationController
  # home, continents, country
  def home
    @all = Country.all
  end

  # show individual continent
  def show
    @continents = Country.select('continent').group('continent')
  end

  # show individual country
  def show
    @country = Country.find(params[:id])
  end
end
