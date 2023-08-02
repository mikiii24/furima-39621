FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('public', 'images', 'test_image.png'), 'image/png') }
    item_info { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    sales_status_id { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_status_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    scheduled_delivery_id { Faker::Number.between(from: 1, to: 3) }
    price       { Faker::Number.between(from: 300, to: 9999999) }
    association :user
  end
end
