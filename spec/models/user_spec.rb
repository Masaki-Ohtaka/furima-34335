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
      it 'パスワードは、６文字以上であれば登録できること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        expect(@user).to be_valid
      end
    end
    
    context '新登録できないとき' do
      it 'メールアドレスが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '重複したメールアドレスが存在した場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@が含まれていなければ登録できないこと' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは、5文字以下であれば登録できないこと' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとパスワード（確認用）、値が一致していなければ登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end