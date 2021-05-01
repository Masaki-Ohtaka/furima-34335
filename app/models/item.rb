class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :title
    validates :item_description
    validates :price
  end
  with_options numericality: { other_than:1} do
  validates :category_id
  validates :item_condition_id
  validates :shipping_change_id
  validates :shipping_area_id
  validates :days_to_ship_id
  end

  belongs_to :user
  has_one    :purchase
  has_one_attached :image  
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_change
  belongs_to :shipping_area
  belongs_to :days_to_ship

end
