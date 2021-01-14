FactoryBot.define do
  factory :item do
    
    product_name                     { 'aa' }
    product_description                 { 'aa' }
    category_id                 { 2 }
    condition_id                { 2 }
    shipping_charge_id          { 2 }
    prefecture_id               { 2 }
    days_to_ship_id             { 2 }
    price                       { 300 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
    
  end
end
