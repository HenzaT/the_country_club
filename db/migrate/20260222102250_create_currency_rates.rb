class CreateCurrencyRates < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_rates do |t|
      t.string :code
      t.integer :rate

      t.timestamps
    end
  end
end
