class AddSeedIdToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :seed_id, :integer
  end
end
