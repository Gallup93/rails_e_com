
FactoryBot.define do
  random_num = (1..999).to_a

  factory :item do
    association :merchant
    name { "Item-#{random_num.pop}" }
    description { "It's so NEAT-#{random_num.pop}" }
    unit_price { ((4..60).to_a.shuffle.pop * 0.5) }
  end
end
