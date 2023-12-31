FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { "g9#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    last_name             { 'てすと' }
    fist_name             { '太郎' }
    last_name_kana        { 'テスト' }
    fist_name_kana        { 'タロウ' }
    birth_date            { Faker::Date.backward }
  end
end
