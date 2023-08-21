FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000000' }
    password_confirmation { password }
    last_name             { 'てすと' }
    fist_name             { '太郎' }
    last_name_kana        { 'テスト' }
    fist_name_kana        { 'タロウ' }
    birth_date            { '00000000' }
  end
end
