module RandomPhoto
  extend ActiveSupport::Concern

  included do
    helper_method :get_random_unsplash_photo

    private

    def random_unsplash_photo(countries)
      random_photos = countries.map(&:country_photo)
      @random_photo = random_photos.sample
    end
  end
end
