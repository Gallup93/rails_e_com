class RemoveSeedIdFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :seed_id, :int
  end
end
