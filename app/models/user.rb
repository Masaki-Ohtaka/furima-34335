class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items,dependent: :destroy
  has_many :purchases
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: "please set including both letters and numbers" 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }do
    validates :last_name  
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." } do
    validates :last_kana
    validates :first_kana
  end

end
