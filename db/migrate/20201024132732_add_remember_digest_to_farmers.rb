class AddRememberDigestToFarmers < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :remember_digest, :string
  end
end
