class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]

  def home
    @continents = Country.select('continent').group('continent')
  end

  # show individual country
  def show
    @country = Country.find(params[:id])
    @user_wishlists = @country.wishlists.where(user_id: current_user)
    @user_favourites = @country.favourites.where(user_id: current_user)
    @wishlist_already_created = Wishlist.exists?(user_id: current_user, country_id: @country)
    @favourite_already_created = Favourite.exists?(user_id: current_user, country_id: @country)
    # fetch api key from secret
    api_key = ENV.fetch("UNSPLASH_ACCESS_KEY")
    # instantiate new UnsplashApi with key
    api = UnsplashApi.new(api_key)
    # response (set to individual country)
    response = api.image_by_country(@country.name)
    # first result
    photo = response['results'].first

    # object of values needed
    @country_image = {
      raw_url: photo["urls"]["raw"],
      alt_description: photo["alt_description"] || "Photo of #{@country.name}",
      photographer_name: photo["user"]["name"],
      photographer_url: photo["user"]["links"]["html"],
      image_page_url: photo["links"]["html"]
    }
  end

  def dashboard
    # left_outer_joins gets all records that have favourite, wishlists (like joins), then specify with where to filter
    @added_countries = Country.left_outer_joins(:favourites, :wishlists).where('favourites.user_id = ? OR wishlists.user_id = ?', current_user.id, current_user.id).distinct
  end
end
