class AddSeedIdToInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    add_column :invoice_items, :seed_id, :integer
  end
end
