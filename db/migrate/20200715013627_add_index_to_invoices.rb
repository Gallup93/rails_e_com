class AddIndexToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_index :invoices, :merchant_id
    add_index :invoices, :customer_id
  end
end
