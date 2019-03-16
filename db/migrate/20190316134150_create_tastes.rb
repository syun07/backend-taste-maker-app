class CreateTastes < ActiveRecord::Migration[5.1]
  def change
    create_table :tastes do |t|
      t.string :name
      t.string :type
      t.string :teaser
      t.string :wUrl
      t.string :yUrl
      t.string :yID

      t.timestamps
    end
  end
end
