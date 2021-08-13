require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入情報保存機能' do
    context '商品購入できる時' do
      it '必要な情報が全て揃っている' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入出来ない時' do
      it 'user情報は必須' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item情報は必須' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
      it '郵便番号空欄' do
        @purchase_address.zip = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zip can't be blank"
      end
      it '郵便番号は半角数字のみ' do
        @purchase_address.zip = '１２３-１２３４'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zip is invalid"
      end
      it '郵便番号はハイフン必須' do
        @purchase_address.zip = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zip is invalid"
      end
      it '郵便番号は頭3文字のみ' do
        @purchase_address.zip = '1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zip is invalid"
      end
      it '郵便番号は後ろ4文字のみ' do
        @purchase_address.zip = '123-56789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zip is invalid"
      end
      it '都道府県未選択' do
        @purchase_address.shipping_from_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Shipping from can't be blank"
      end
      it '市区町村空欄' do
        @purchase_address.address_line1 = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address line1 can't be blank"
      end
      it '番地空欄' do
        @purchase_address.address_line2 = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address line2 can't be blank"
      end
      it '電話番号空欄' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone can't be blank"
      end
      it '電話番号は半角数字しか登録できない' do
        @purchase_address.telephone = '０１０１１１１１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone is invalid"
      end
      it '電話番号は10or11桁しか登録できない' do
        @purchase_address.telephone = '010000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone is invalid"
      end
    end
    context 'クレカ支払いが可能' do
      it '必要な情報が全て揃っている' do
        expect(@purchase_address).to be_valid
      end
    end
    context 'クレカ支払いができない時' do
      it 'クレカ情報が空欄' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
