class CreateFarmers < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.string :comment

      t.timestamps
    end
  end
end
