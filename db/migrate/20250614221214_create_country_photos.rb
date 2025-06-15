class CreateCountryPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :country_photos do |t|
      t.text :image_url
      t.text :image_alt
      t.string :photographer_name
      t.text :photographer_url
      t.text :image_page_url
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
