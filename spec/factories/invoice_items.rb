FactoryBot.define do
  factory :invoice_item do
    id { "" }
    item_id { "" }
    invoice_id { "" }
    quantity { "" }
    unit_price { "" }
    created_at { "MyString" }
    updated_at { "MyString" }
  end
end
