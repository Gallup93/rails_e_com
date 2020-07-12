FactoryBot.define do
  factory :transaction do
    id { "" }
    invoice_id { "" }
    credit_card_number { "" }
    result { "MyString" }
    created_at { "MyString" }
    updated_at { "MyString" }
  end
end
