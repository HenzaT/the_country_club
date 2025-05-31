class RenameVisitToFavourite < ActiveRecord::Migration[7.1]
  def change
    rename_table :visits, :favourites
  end
end
