class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_change
  belongs_to :shipping_area
  belongs_to :days_to_ship
  
  belongs_to :user, optional: true
  has_one    :purchase
  has_one_attached :image 

  with_options presence: true do
    validates :image
    validates :title
    validates :item_description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than:1} do
  validates :category_id
  validates :item_condition_id
  validates :shipping_change_id
  validates :shipping_area_id
  validates :days_to_ship_id
  end
   
end
