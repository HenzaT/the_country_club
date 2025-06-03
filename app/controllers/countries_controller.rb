class CountriesController < ApplicationController
  # home, continents, show
  def home
    @continents = Country.select('continent').group('continent')
    # @africa = Country.where(continent: 'Africa')
    # @europe = Country.where(continent: 'Europe')
    # @asia = Country.where(continent: 'Asia')
    # @oceania = Country.where(continent: 'Oceania')
    # @north_america = Country.where(region: 'North America')
    # @central_america = Country.where(region: 'Central America')
    # @south_america = Country.where(region: 'South America')
  end

  # show individual country
  def show
    @country = Country.find(params[:id])
    @user_wishlists = @country.wishlists.where(user_id: current_user)
    @wishlist_already_created = Wishlist.exists?(user_id: current_user, country_id: @country)
    @wishlist = Wishlist.where(user_id: current_user, country_id: @country)
    @user_favourites = @country.favourites.where(user_id: current_user)
    @favourite_already_created = Favourite.exists?(user_id: current_user, country_id: @country)
    @favourite = Favourite.where(user_id: current_user, country_id: @country)
  end
end
