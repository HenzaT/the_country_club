class User < ApplicationRecord
  has_many :favourites
  has_many :wishlists
  has_many :favourite_countries, through: :favourites, source: :country
  has_many :desired_countries, through: :wishlists, source: :country
  validates :email, :first_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
