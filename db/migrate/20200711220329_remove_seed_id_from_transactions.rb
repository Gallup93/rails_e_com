class RemoveSeedIdFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :seed_id, :int
  end
end
