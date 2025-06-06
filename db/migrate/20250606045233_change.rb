class Change < ActiveRecord::Migration[7.1]
  def change
    change_column :countries, :flag_alt, :text
  end
end
