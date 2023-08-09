FactoryBot.define do
  factory :order_address do
    item_id { 1 }
    user_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    shipping_prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    addresses { "青山1-1-1" }
    building { "柳ビル103" }
    phone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
  end
end