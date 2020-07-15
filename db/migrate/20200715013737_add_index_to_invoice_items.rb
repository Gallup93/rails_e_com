class AddIndexToInvoiceItems < ActiveRecord::Migration[5.2]
  def change
      add_index :invoice_items, :item_id
      add_index :invoice_items, :invoice_id
  end
end
