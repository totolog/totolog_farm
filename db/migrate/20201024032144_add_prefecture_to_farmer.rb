class AddPrefectureToFarmer < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :prefecture, :string
  end
end
