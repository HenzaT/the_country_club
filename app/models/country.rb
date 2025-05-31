class Country < ApplicationRecord
  has_many :favourites
  has_many :wishlists
  has_many :fans, through: :favourites, source: :user
  has_many :desirees, through: :wishlists, source: :user
  validates :name, :language_one, :continent, presence: true
  validates :flag, :timezone, :population, :latitude, :longitude, presence: true
end
