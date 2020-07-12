class RemoveSeedIdFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :seed_id, :int
  end
end
