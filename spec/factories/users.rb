FactoryBot.define do
  factory :user do
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation   { password }
    nickname                { Faker::Name.last_name }
    first_name_kanji        { '太郎' }
    family_name_kanji       { '山田' }
    first_name_kana         { 'タロウ' }
    family_name_kana        { 'ヤマダ' }
    birthday                { 19_801_010 }
  end
end
