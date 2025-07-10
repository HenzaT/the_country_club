class AddCurrencyCodeToCountry < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :currency_code, :string
  end
end
