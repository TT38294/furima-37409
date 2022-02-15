require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録ができる時' do
      it '全ての項目の入力がが存在すれば登録できる' do
        expect(@user.save)
      end

      it 'passwordが6文字以上かつ半角英数字混合であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end

    context '登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages)
      end

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordが半角数字のみのときに登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordが半角英語のみのときに登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordが全角のときに登録できない' do
        @user.password = '１２３４５A'
        @user.password_confirmation = '１２３４５A'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "family_nameがない場合は登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "first_nameがない場合は登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "family_name_kanaがない場合は登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "first_name_kanaがない場合は登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it "birth_dayがない場合は登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end
    end
  end
end
