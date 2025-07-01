class Wishlist < ApplicationRecord
  belongs_to :country, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :user_id, uniqueness: { scope: :country_id }
  validates :desire_rating, presence: true
  validates :desire_rating, numericality: true
  validates :desire_rating, numericality: { only_integer: true }
  validates :desire_rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
