FactoryBot.define do
  factory :order_form do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '東京1-1' }
    building_name { '東京ビル101' }
    phone_number { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end