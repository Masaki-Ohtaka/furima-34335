require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:user)
  end

  describe '出品登録機能' do
    context '出品登録できるとき' do
      it '１枚の出品画像の選択,商品名、商品の説明、価格が入力されてあり、プルダウン方式のカテゴリー、商品の状態、発送元の地域、発送までの日数が「---」以外の選択であれば登録できること' do
        expect(@item).to be_valid
      end
    end
    
    context '出品登録できないとき' do

      it '画像の登録をしていない時登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空では登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーが「---」を選択している時登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が「---」を選択している時登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.condition_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担が「---」を選択している時登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.delivery_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end
      it '配送元の地域が「---」を選択している時登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.location_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Location must be other than 1")
      end
      it '配送までの日数が「---」を選択している時登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.days_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it '価格が空では登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.price =  nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円より少なけれれば登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.price =  299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が9,999,999円より多ければ登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.price =  10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end 
      it '価格は半角数字以外だと登録できないこと' do
        @item = FactoryBot.build(:item)
        @item.price =  "あいうえお"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end         
    end
  end
end
