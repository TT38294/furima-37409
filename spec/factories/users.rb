FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@com' }
    password              { 'test1111' }
    password_confirmation { 'test1111' }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2000-01-01' }
  end
end
