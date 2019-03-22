class RemoveTypeFromTastes < ActiveRecord::Migration[5.1]
  def change
    remove_column :tastes, :type, :string
  end
end
