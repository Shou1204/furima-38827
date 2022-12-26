FactoryBot.define do
  factory :user do
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    nickname                { Faker::Name.last_name }
    first_name_kanji        { '太郎' }
    family_name_kanji       { '山田' }
    first_name_kana         { 'タロウ' }
    family_name_kana        { 'ヤマダ' }
    birthday                { 19801010 }
  end
end
