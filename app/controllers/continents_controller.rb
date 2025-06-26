class ContinentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  include RandomPhoto

  def show
    @continent = params[:id]
    @countries = Country.where(continent: @continent)

    get_random_unsplash_photo
  end
end
