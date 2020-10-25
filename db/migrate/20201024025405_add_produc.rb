class AddProduc < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :farmer, nul: false, foreign_key: true
  end
end
