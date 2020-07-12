class AddSeedIdToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :seed_id, :integer
  end
end
