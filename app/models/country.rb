class Country < ApplicationRecord
  validates :name, :currency, :capital, :language_one, :continent, presence: true
  validates :region, :flag, :timezone, :population, :latitude, :longitude, presence: true
end
