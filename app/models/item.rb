class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order 

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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge
  belongs_to  :category
  belongs_to  :condition
  belongs_to  :prefecture
  belongs_to  :days_to_ship

end
