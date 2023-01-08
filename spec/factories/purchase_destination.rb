FactoryBot.define do
  factory :purchase_destination do
    post { "123-1234" }
    prefecture_id { 2 }
    city { '品川区４丁目' }
    address { '1-1' }
    phone_number { Faker::Number.number(digits: 10)|Faker::Number.number(digits: 11)  }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
