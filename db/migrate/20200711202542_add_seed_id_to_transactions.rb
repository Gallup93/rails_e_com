class AddSeedIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :seed_id, :integer
  end
end
