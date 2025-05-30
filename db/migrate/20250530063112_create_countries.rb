class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :currency
      t.string :capital
      t.string :language_one
      t.string :language_two
      t.string :language_three
      t.string :continent
      t.string :region
      t.string :flag
      t.string :timezone
      t.integer :population
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
