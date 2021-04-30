class Item < ApplicationRecord

  belongs_to :user
  has_one    :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_description
  belongs_to :shipping_change
  belongs_to :shipping_area
  belongs_to :days_to_ship
end
