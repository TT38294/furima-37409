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
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messsages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'describeが空だと出品できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messsages).to include("Describe can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messsages).to include("Category_id can't be blank")
      end
      it 'status_idが未選択だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messsages).to include("Status_id can't be blank")
      end
      it 'charge_idが未選択だと出品できない' do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messsages).to include("Charge_id can't be blank")
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messsages).to include("Prefecture_id can't be blank")
      end
      it 'shipping_days_idが未選択だと出品できない' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messsages).to include("Shipping_days_id can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messsages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "１０００"
        @item.valid?
        binding.pry
        expect(@item.errors.full_messsages).to include("")
      end
    end
  end
end
