class AddTelEmailColumnToFarmer < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :tel, :string
    add_column :farmers, :email, :string
  end
end
