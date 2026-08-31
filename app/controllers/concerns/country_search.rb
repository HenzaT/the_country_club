module CountrySearch
  extend ActiveSupport::Concern

  included do
    helper_method :search_for_country

    private

    def search_for_country(countries)
      params[:query].present? ? countries.where('name ILIKE ?', "%#{params[:query]}%") : countries
    end
  end
end
