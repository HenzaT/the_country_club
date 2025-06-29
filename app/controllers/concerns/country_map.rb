module CountryMap
  extend ActiveSupport::Concern

  included do
    helper_method :mapbox_markers

    private

    def mapbox_markers
      @markers = @countries.geocoded.map do |country|
        {
          lat: country.latitude,
          lng: country.longitude,
          info_window_html: render_to_string(
            partial: 'shared/info_window_mapbox',
            locals: { country: country }
          )
        }
      end
    end
  end
end
