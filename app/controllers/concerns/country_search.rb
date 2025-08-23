module CountrySearch
  extend ActiveSupport::Concern

  included do
    helper_method :search_for_country

    private

    def search_for_country(countries)
      if params[:query].present?
        countries.where("name ILIKE ?", "%#{params[:query]}%")
      else
        countries
      end
    end
  end
end
