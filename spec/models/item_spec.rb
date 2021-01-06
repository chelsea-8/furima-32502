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
      expect(@item.errors.full_messages).to include("出品画像を入力してください")
    end
    it '商品名がないと商品は保存できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品説明がないと商品は保存できない' do
      @item.item_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it '商品カテゴリーを選択しないと商品は保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品のカテゴリーを選択してください")
    end
    it '商品カテゴリーが空の場合商品は保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品のカテゴリーを入力してください")
    end
    it '商品状態を選択しないと商品は保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end
    it '商品状態が空の場合商品は保存できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it '送料負担を選択しないと商品は保存できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end
    it '送料負担が空の場合商品は保存できない' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送元を選択しないと商品は保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end
    it '発送元が空の場合商品は保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送日数を選択しないと商品は保存できない' do
      @item.dispatch_timing_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
    it '発送日数が空だと商品は保存できない' do
      @item.dispatch_timing_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '価格がないと商品は保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end
    it '価格が入力されていても300円未満では商品は保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格が設定可能な価格の範囲外です")
    end
    it '価格が入力されていても9,999,999円以上では商品は保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格が設定可能な価格の範囲外です")
    end
    it '価格を半角数字で入力しなければ商品は保存できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
    end
    it 'ユーザーが紐付いていないと商品は保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end
  end
end
end