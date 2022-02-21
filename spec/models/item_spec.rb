require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報入力' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品情報入力がうまくいった場合' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.charge_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.shipping_days_id = 2
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまくいかない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'describeが空だと出品できない' do
        @item.describe = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが未選択だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'charge_idが未選択だと出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge must be other than 1')
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'shipping_days_idが未選択だと出品できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days must be other than 1')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが設定金額範囲外だと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9_999_999円を超えると出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
