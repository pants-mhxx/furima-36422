require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録機能' do
    context '商品登録できる時' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録出来ない時' do
      it '画像なし' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名空欄' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品説明空欄' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリー未選択' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品状態未選択' do
        @item.item_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Item state can't be blank"
      end
      it '送料の負担未選択' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it '発送元の地域未選択' do
        @item.shipping_from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping from can't be blank"
      end
      it '発送までの日数未選択' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '価格空欄' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格¥300以下' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299'
      end
      it '価格¥10,000,000以上' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it '金額が全角では登録できない' do
        @item.price = '３３３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '金額は半角英数字混合では登録できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '金額は半角英字だけでは登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
