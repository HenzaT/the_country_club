require 'httparty'

class Country < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name, :capital]

  has_many :country_photos, dependent: :destroy
  geocoded_by :address
  geocoded_by :capital_address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.capital_address.present? }
  has_one :country_photo
  has_many :favourites
  has_many :wishlists
  has_many :fans, through: :favourites, source: :user
  has_many :desirees, through: :wishlists, source: :user
  validates :name, :language_one, :continent, :flag_alt, :area, presence: true
  validates :flag, :timezone, :population, :latitude, :longitude, presence: true

  def address
    [latitude, longitude].compact.join(', ')
  end

  def capital_address
    [capital_latitude, capital_longitude].compact.join(', ')
  end
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
