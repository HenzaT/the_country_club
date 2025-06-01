class WishlistsController < ApplicationController
  def new
    @country = Country.find(params[:country_id])
    @wishlist = Wishlist.new
    @wishlist_already_created = Wishlist.exists?(user_id: current_user, country_id: @country)
  end

  def create
    @country = Country.find(params[:country_id])
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.country = @country
    @wishlist.user = current_user
    if @wishlist.save
      redirect_to country_path(@country)
    else
      render :new, status: :unprocessable_entity
    end
  end
end


private

def wishlist_params
  params.require(:wishlist).permit(:desire_rating, :note, :future_visit_date)
end
