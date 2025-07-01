class WishlistsController < ApplicationController
  before_action :set_country, only: %i[new create edit update]

  def new
    @wishlist = Wishlist.new
    @wishlist_already_created = Wishlist.exists?(user_id: current_user, country_id: @country)
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.country = @country
    @wishlist.user = current_user
    if @wishlist.save
      redirect_to country_path(@country)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wishlist = Wishlist.find_by country_id: @country
  end

  def update
    @wishlist = Wishlist.find_by country_id: @country
    @wishlist.user = current_user
    if @wishlist.update(wishlist_params)
      redirect_to country_path(@country)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @country = @wishlist.country
    @wishlist.destroy
    redirect_to country_path(@country), status: :see_other
  end
end

private

def wishlist_params
  params.require(:wishlist).permit(:desire_rating, :note, :future_visit_date)
end

def set_country
  @country = Country.find(params[:country_id])
end
