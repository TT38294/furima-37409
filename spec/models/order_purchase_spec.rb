require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_purchase = FactoryBot.build(:order_purchase)
    end

    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_purchase).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_purchase.post_code = '123-4560'
        expect(@order_purchase).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_purchase.prefecture_id = 2
        expect(@order_purchase).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_purchase.municipalities = '横浜市'
        expect(@order_purchase).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_purchase.address = '緑区１２３'
        expect(@order_purchase).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_purchase.building_name = ''
        expect(@order_purchase).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_purchase.tel_number = 12_345_678_910
        expect(@order_purchase).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @order_purchase.post_code = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_purchase.post_code = 1_234_567
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_purchase.prefecture_id = 1
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '都道府県が空だと保存できないこと' do
        @order_purchase.prefecture_id = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_purchase.municipalities = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_purchase.address = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_purchase.tel_number = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Tel number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_purchase.tel_number = '123 - 1234 - 1234'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Tel number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_purchase.tel_number = 12_345_678_910_123_111
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Tel number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_purchase.token = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
