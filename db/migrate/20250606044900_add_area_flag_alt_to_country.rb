class AddAreaFlagAltToCountry < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :area, :integer
    add_column :countries, :flag_alt, :string
  end
end
