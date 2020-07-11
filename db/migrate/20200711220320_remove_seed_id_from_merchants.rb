class RemoveSeedIdFromMerchants < ActiveRecord::Migration[5.2]
  def change
    remove_column :merchants, :seed_id, :int
  end
end
