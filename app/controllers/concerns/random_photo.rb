module RandomPhoto
  extend ActiveSupport::Concern

  included do
    helper_method :get_random_unsplash_photo

    private

    def random_unsplash_photo(countries)
      random_photos = []

      countries.each do |country|
        random_photos << CountryPhoto.where(country_id: country.id)
      end
      @random_photo = random_photos.sample.first
    end
  end
end
