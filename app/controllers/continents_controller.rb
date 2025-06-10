class ContinentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @continent = params[:id]
    @countries = Country.where(continent: @continent)
  end
end
