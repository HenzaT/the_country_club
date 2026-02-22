class ChangeRateTypeInCurrencyRates < ActiveRecord::Migration[7.1]
  def change
    change_column :currency_rates, :rate, :decimal, precision: 20, scale: 10
  end
end
