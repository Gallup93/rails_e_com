class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.bigint :credit_card_number
      t.string :result
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
