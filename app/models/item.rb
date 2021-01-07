class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :image
    validates :product_description
  end

  validates_inclusion_of :price, in: 300..9999999


  with_options numericality: { other_than: 1 } do
  validates :prefecture_id
  validates :category_id
  validates :condition_id
  validates :shipping_charge_id
  validates :days_to_ship_id
  end
end
