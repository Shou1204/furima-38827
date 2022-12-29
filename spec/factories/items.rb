FactoryBot.define do
  factory :item do
    name                   { Faker::Name.last_name }
    details                { Faker::String.random(length: 1..1000) }
    price                  { 10_000 }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_charge_id     { 2 }
    prefecture_id          { 2 }
    ship_date_id           { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
