class AddSeedIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :seed_id, :integer
  end
end
