class AddCurrencySymbolAndCapitalCoordinatesToCountry < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :currency_symbol, :string
    add_column :countries, :capital_latitude, :float
    add_column :countries, :capital_longitude, :float
  end
end
