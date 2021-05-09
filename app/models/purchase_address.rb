class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token,:postal_code, :location_id, :municipality, :address, :building_name, :phone_number
    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :token
      validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
      validates :location_id, numericality: { other_than:1} 
      validates :municipality
      validates :address
      validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'is invalid. Include half-width numbers' } 
    end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, location_id: location_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end