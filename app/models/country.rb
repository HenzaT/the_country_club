class Country < ApplicationRecord
  has_many :visits
  validates :name, :language_one, :continent, presence: true
  validates :flag, :timezone, :population, :latitude, :longitude, presence: true
end
