class Favourite < ApplicationRecord
  belongs_to :country, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :user_id, uniqueness: { scope: :country_id }
  validates :visit_date, :rating, :times_visited, presence: true
  # date as "YYYY-MM-DD" in MySQL
  validates :rating, :times_visited, numericality: true
  validates :rating, :times_visited, numericality: { only_integer: true }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
