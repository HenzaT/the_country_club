class ChangeLatLonToBeFloatInCountries < ActiveRecord::Migration[7.1]
  def change
    change_column :countries, :latitude, :float
    change_column :countries, :longitude, :float
  end
end
