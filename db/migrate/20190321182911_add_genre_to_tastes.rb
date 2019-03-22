class AddGenreToTastes < ActiveRecord::Migration[5.1]
  def change
    add_column :tastes, :genre, :string
  end
end
