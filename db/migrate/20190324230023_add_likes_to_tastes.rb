class AddLikesToTastes < ActiveRecord::Migration[5.1]
  def change
    add_column :tastes, :likes, :integer
  end
end
