class FavouritesController < ApplicationController
  before_action :set_country, only: %i[new create edit update]

  def new
    @favourite = Favourite.new
    @favourite_already_created = Favourite.exists?(user_id: current_user, country_id: @country)
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.country = @country
    @favourite.user = current_user
    if @favourite.save
      redirect_to country_path(@country)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @favourite = Favourite.find_by country_id: @country
  end

  def update
    @favourite = Favourite.find_by country_id: @country
    @favourite.user = current_user
    if @favourite.update(favourite_params)
      redirect_to country_path(@country)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @country = @favourite.country
    @favourite.destroy
    redirect_to country_path(@country), status: :see_other
  end
end

private

def favourite_params
  params.require(:favourite).permit(:visit_date, :note, :rating, :times_visited, photos: [])
end     

def set_country
  @country = Country.find(params[:country_id])
end
