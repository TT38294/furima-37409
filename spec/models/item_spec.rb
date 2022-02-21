require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報入力' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品情報入力がうまくいかない場合' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまくいかない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
      end
      it 'describeが空だと出品できない' do
        @item.describe = nil
        @item.valid?
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 0
        @item.valid?
      end
      it 'status_idが未選択だと出品できない' do
        @item.status_id = 0
        @item.valid?
      end
      it 'charge_idが未選択だと出品できない' do
        @item.charge_id = 0
        @item.valid?
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
      end
      it 'shipping_days_idが未選択だと出品できない' do
        @item.shipping_days_id = 0
        @item.valid?
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
      end
      it 'priceが設定金額範囲外だと出品できない' do
        @item.price = "100"
        @item.valid?
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "１０００"
        @item.valid?
      end
    end
  end
end
