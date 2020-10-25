class CreateFarmerImages < ActiveRecord::Migration[5.2]
  def change
    create_table :farmer_images do |t|
      t.string :farmer_logo
      t.string :farmer_image
      t.references :farmer, foreign_key: true

      t.timestamps
    end
  end
end
