require 'date'
require 'json'
require 'open-uri'

class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]

  def home
    @continents = Country.select('continent').group('continent')
    all_photos = CountryPhoto.all
    @photo = all_photos.sample
  end

  # show individual country
  def show
    @country = Country.find(params[:id])
    @user_wishlists = @country.wishlists.where(user_id: current_user)
    @user_favourites = @country.favourites.where(user_id: current_user)
    @wishlist_already_created = Wishlist.exists?(user_id: current_user, country_id: @country)
    @favourite_already_created = Favourite.exists?(user_id: current_user, country_id: @country)
    @country_photo = CountryPhoto.find_by(country_id: @country)
    capital_address_marker
    currency_exchange_usd(@country)
  end

  def dashboard
    # left_outer_joins gets all records that have favourite, wishlists (like joins), then specify with where to filter
    @added_countries = Country.left_outer_joins(:favourites, :wishlists).where('favourites.user_id = ? OR wishlists.user_id = ?', current_user.id, current_user.id).distinct
  end

  def suggest_claude
    country = Country.find(params[:id])
    result = claude_suggestions(country.name)
    if result
      render json: { response: result }
    else
      return 'Claude is currently overloaded'
    end
  end

  def suggest_season
    country = Country.find(params[:id])
    result = seasonal_suggestions(country.name)
    if result
      render json: { response: result }
    else
      return 'Claude is currently overloaded'
    end
  end

  private

  def capital_address_marker
    @capital_markers = [{
        lat: @country.capital_latitude,
        lng: @country.capital_longitude,
        info_window_html: render_to_string(partial: 'shared/info_window_mapbox', locals: { country: @country })
      }]
  end

  def currency_exchange_usd(country)
    currency_code = country.currency_code
    url = "https://openexchangerates.org/api/latest.json?app_id=#{ENV.fetch('OPEN_EXCHANGE_APP_ID')}"
    currency_json = URI.parse(url).read
    all_currencies = JSON.parse(currency_json)
    base_country_rate = all_currencies['rates']["#{currency_code}"] || 'Not Found'
    uk_rate = all_currencies['rates']['GBP']
    country_rate = base_country_rate / uk_rate
    @country_rate = country_rate.round(3)
  end

  def claude_suggestions(country)
    claude = AiAgent.new.claude
    message =
      "Write 1 or 2 opening sentences about #{country} as a travel destination.
      Then, return a list of key attractions containing 5 popular tourist attractions as <ol> elements.
      Describe each attraction with 1 or 2 sentences. Don't ask any questions.
      Leave a <br> between the opening paragraph and the list."
    response = claude.messages(
      claude.user_message(message),
      { model: Claude::Model::CLAUDE_FASTEST }
    )
    AiAgent.new.format_claude_response(response)
  end

  def seasonal_suggestions(country)
    claude = AiAgent.new.claude
    message =
      "Write 1 or 2 opening sentences about the best time of year to visit #{country} as a travel destination.
      Then, return a list of other alternative times of year as <ol> elements.
      If a particular time of year is cheaper, mention it.
      Leave a <br> between the opening paragraph and the list."
    response = claude.messages(
      claude.user_message(message),
      { model: Claude::Model::CLAUDE_FASTEST }
    )
    AiAgent.new.format_claude_response(response)
  end
end
