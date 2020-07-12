FactoryBot.define do
  factory :invoice do
    id { "" }
    customer_id { "" }
    merchant_id { "" }
    stats { "MyString" }
    created_at { "MyString" }
    updated_at { "MyString" }
  end
end
