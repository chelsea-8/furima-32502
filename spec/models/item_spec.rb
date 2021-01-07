require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
  end


describe '商品出品機能' do
  context '出品登録ができる場合' do
    it '商品の画像、名前、説明、カテゴリー、状態、送料負担、発送元、発送日数、価格があれば商品は保存される' do
      expect(@item).to be_valid
    end
  end
  context '出品登録ができない場合' do
    it '画像がないと商品は保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end
    it '商品名がないと商品は保存できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品説明がないと商品は保存できない' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end
    it '商品カテゴリーを選択しないと商品は保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品カテゴリーが空の場合商品は保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it '商品状態を選択しないと商品は保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '商品状態が空の場合商品は保存できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end
    it '送料負担を選択しないと商品は保存できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it '送料負担が空の場合商品は保存できない' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end
    it '発送元を選択しないと商品は保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送元が空の場合商品は保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it '発送日数を選択しないと商品は保存できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end
    it '発送日数が空だと商品は保存できない' do
      @item.days_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship is not a number")
    end
    it '価格がないと商品は保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格が入力されていても300円未満では商品は保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格が入力されていても9,999,999円以上では商品は保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格を半角数字で入力しなければ商品は保存できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'ユーザーが紐付いていないと商品は保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it '全角文字では登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '半角英数混合では登録できないこと' do
      @item.price = '/\A[a-z0-9]+\z/'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '半角英語だけでは登録できないこと' do
      @item.price = '/\A[a-z]+\z/'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

  end
end
end