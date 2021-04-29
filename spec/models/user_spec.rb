require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'メールアドレス、パスワード、パスワード（確認認）が入力されてあれば登録できること' do
        expect(@user).to be_valid
      end
      it 'パスワードは、６文字以上の半角英数字混合であれば登録できること' do
        @user.password = '00aaaa'
        @user.password_confirmation = '00aaaa'
        expect(@user).to be_valid
      end
      it 'ユーザー名字は、全角（漢字・ひらがな・カタカナ）での入力であれば登録できること' do
        @user.first_name = '大魔神サさき'
        expect(@user).to be_valid
      end
      it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力があれば登録できること' do
        @user.first_name = '小たロウ'
        expect(@user).to be_valid
      end
      it 'ユーザー名字のフリガナは、全角（カタカナ）での入力であれば登録できること' do
        @user.last_name = 'ダイマジンササキ'
        expect(@user).to be_valid
      end
      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力であれば登録できること' do
        @user.first_name = 'コタロウ'
        expect(@user).to be_valid
      end
    end
    
    context '新登録できないとき' do
      it 'メールアドレスが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスが存在した場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに不適適切な値では登録ができないこと' do
        @user.email = '間イウエオ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'メールアドレスに@が含まれていなければ登録できないこと' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは英数字だけでは登録できないこと' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password please set including both letters and numbers")
      end
      it 'パスワードは半角英字だけでは登録できないこと' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password please set including both letters and numbers")
      end
      it 'パスワードが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、5文字以下であれば登録できないこと' do
        @user.password = 'aaaa0'
        @user.password_confirmation = 'aaaa0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとパスワード（確認用）、値が一致していなければ登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが入力してあってもパスワード（確認用）が空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー名字のフリガナが空では登録できないこと' do
         @user.last_kana = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'ユーザー名前のフリガナが空では登録できないこと' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'ユーザー名字のフリガナ以外の入力がある時登録できないこと' do
        @user.last_kana = 'a位ウeo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid. Input full-width katakana characters.')
      end
      it 'ユーザー名前のフリガナ以外の入力がある時登録できないこと' do
        @user.first_kana = '大魔神saサキ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid. Input full-width katakana characters.')
      end  
      it '生年月日が空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end