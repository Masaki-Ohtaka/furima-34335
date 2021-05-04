class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :location
  belongs_to :item_date
  
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
    validates :condition_id
    validates :delivery_id
    validates :location_id
    validates :item_date_id
  end
end
