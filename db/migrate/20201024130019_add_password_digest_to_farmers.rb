class AddPasswordDigestToFarmers < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :password_digest, :string
  end
end
