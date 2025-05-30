class Country < ApplicationRecord
  validates :name, :language_one, :continent, presence: true
  validates :flag, :timezone, :population, :latitude, :longitude, presence: true
end
