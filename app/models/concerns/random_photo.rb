module Random_Photo
  extend ActiveSupport::Concern

  included do
    helper_method :get_random_unsplash_photo

    private

    def get_random_unsplash_photo
      # fetch api key from secret
      api_key = ENV.fetch("UNSPLASH_ACCESS_KEY")
      # instantiate new UnsplashApi with key
      api = UnsplashApi.new(api_key)
      all_photos = @countries.map do |country|
        # response (set to individual country)
        response = api.image_by_country(country.name)
        # first result
        photo = response['results'].first
        # object of values needed
        {
          raw_url: photo["urls"]["raw"],
          description: "#{country.name}",
          alt_description: photo["alt_description"] || "Photo of #{country.name}",
          photographer_name: photo["user"]["name"],
          photographer_url: photo["user"]["links"]["html"],
          image_page_url: photo["links"]["html"]
        }
      end

      @selected_photo = all_photos.sample
    end
  end
end
