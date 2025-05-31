class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.date :visit_date
      t.text :note
      t.integer :rating
      t.integer :times_visited
      t.references :country, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
