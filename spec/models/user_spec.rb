require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailの記述は@が含まれていなければならない' do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードとパスワード(確認)は一致しなければ登録できない' do
        @user.password_confirmation = 'waa111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordは6文字以下では登録できない' do
        @user.password = 'aaa12'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_furiganaが空では登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last furigana can't be blank"
      end

      it 'first_furiganaが空では登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First furigana can't be blank"
      end

      it '名前は全角（漢字・ひらがな・カタカナ）での入力が必須' do
        @user.last_name = 'abc'
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it '名前カナは全角カタカナ入力が必須' do
        @user.last_furigana = '123'
        @user.first_furigana = '1112'
        @user.valid?
        expect(@user.errors.full_messages).to include "First furigana is invalid"
      end
  
      it '生年月日の入力は必須' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end