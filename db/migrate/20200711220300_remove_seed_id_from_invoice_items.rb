class RemoveSeedIdFromInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoice_items, :seed_id, :int
  end
end
