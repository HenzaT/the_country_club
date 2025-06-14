require 'httparty'

class Country < ApplicationRecord
  has_many :favourites
  has_many :wishlists
  has_many :fans, through: :favourites, source: :user
  has_many :desirees, through: :wishlists, source: :user
  validates :name, :language_one, :continent, :flag_alt, :area, presence: true
  validates :flag, :timezone, :population, :latitude, :longitude, presence: true
end

# create this class so that I don't instantiate new Country instances every time
class UnsplashApi
  include HTTParty
  base_uri 'https://api.unsplash.com'

  def initialize(api_key)
    @headers = { "Authorization" => "Client-ID #{api_key}" }
  end

  # appends this to base uri
  def image_by_country(name)
    self.class.get("/search/photos", headers: @headers, query: { query: name, per_page: 1 })
  end
end
