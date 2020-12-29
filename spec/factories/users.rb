FactoryBot.define do
  factory :user do
    nike_name             { 'aa' }
    email                 { 'aa@aa' }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name             { 'てすと' }
    first_name            { 'てすと' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    barth_day             { '1930-1-1' }
  end
end