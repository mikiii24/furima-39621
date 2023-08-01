FactoryBot.define do
  Faker::Config.locale = :ja
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'test1234' }
    password_confirmation { password }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { 'カナ' }
    first_name_kana       { 'カナ' }
    birth_date { '2000-01-01' }
  end
end
