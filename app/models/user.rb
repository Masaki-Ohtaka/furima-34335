class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,presence: true 
  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ入力出来る
    validates :last_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ入力出来る
    validates :last_kana, :first_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  end
  validates :birthday,presence: true 
  
  has_many :itemes
  has_many :purchases

end
