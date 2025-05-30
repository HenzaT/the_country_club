class CountrysController < ApplicationController
  def index
    @europe = Country.where(continent: 'Europe')
  end
end
