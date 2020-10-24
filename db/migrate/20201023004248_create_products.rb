class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :content
      t.string :comment
      t.integer :count
      t.string :category

      t.timestamps
    end
  end
end
