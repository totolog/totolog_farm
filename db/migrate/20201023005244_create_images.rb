class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :product, foreign_key: true
      t.string :img1
      t.string :img2
      t.string :img3
      t.string :img4
      t.string :img5

      t.timestamps
    end
  end
end
