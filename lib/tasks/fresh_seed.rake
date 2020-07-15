require 'csv'

desc "drop and reseed database"
task fresh_seed: :environment do

  model_paths = {Customer => "customers",  Merchant => "merchants",  Invoice => "invoices", Item => "items",
                InvoiceItem => "invoice_items", Transaction => "transactions"}

  model_paths.keys.reverse.each do |model|
    model.destroy_all
  end

  model_paths.each do |model, path|
    CSV.foreach("./data/#{path}.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
      new_instance = model.create(row.to_h)
      if model.column_names.include? "unit_price"
        new_instance.unit_price = (new_instance.unit_price * 0.01).round(2)
        new_instance.save
      end
    end
  end
end
