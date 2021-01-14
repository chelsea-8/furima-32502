require 'rails_helper'
RSpec.describe OrderForm, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: buyer.id, item_id: @item.id)
  end
  describe '商品購入記録の保存' do
    context '商品購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_form.postal_code = '１２３４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code はハイフンを挟んだ半角数字で入力してください')
      end
      it '都道府県が空だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県を選択しないと保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '市区町村が空だと保存できないこと' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は半角数字以外だと保存できないこと' do
        @order_form.phone_number = '１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number は半角数字で入力してください")
      end
      it '電話番号は半角英数字混合では保存できないこと' do
        @order_form.phone_number = '123abc456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number は半角数字で入力してください")
      end
      it '電話番号は12桁以上だと保存できないこと' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'user_idが空では保存できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end