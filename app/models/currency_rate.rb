class CurrencyRate < ApplicationRecord
  has_many :countries
  validates :code, :rate, presence: true
  validates :rate, numericality: true
end
