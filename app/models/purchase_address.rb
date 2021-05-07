class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,  :postal_code, :location, :municipality, :address, :building_name, :phone_number
  with_options presence: true do
    validates :user_id
    validates :item_id
    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    # 購入情報を保存し、変数puchasに代入する要確認
    purchase = purchase.create(item: item_id, user_id: user_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Address.create(postal_code: postal_code, location: location, municipality: municipality, :building_name building_name, :phone_number phone_number, purchase_id: purchase.id)
  end
end