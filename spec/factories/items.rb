FactoryBot.define do
  factory :item do
    name             { Faker::Lorem.words }
    description      { Faker::Lorem.sentence }
    category_id      { 3 }
    item_state_id    { 3 }
    shipping_fee_id  { 3 }
    shipping_from_id { 3 }
    shipping_day_id  { 3 }
    price            { Faker::Number.between(300, 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/mvc.png'), filename: 'mvc.png')
    end
  end
end
