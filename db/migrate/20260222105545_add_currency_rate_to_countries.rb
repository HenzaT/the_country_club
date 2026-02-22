class AddCurrencyRateToCountries < ActiveRecord::Migration[7.1]
  def change
    add_reference :countries, :currency_rate, null: false, foreign_key: true
  end
end
