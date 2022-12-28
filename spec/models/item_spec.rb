require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailsがないと出品できない' do
        @item.details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it 'category_idが「1」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category カテゴリーを選んでください")
      end
      it 'condition_idが「1」だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition 商品の状態を選んでください")
      end
      it 'shipping_charge_idが「1」だと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge 配送料の負担を選んでください")
      end
      it 'prefecture_idが「1」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture 発送元の地域を選んでください")
      end
      it 'ship_date_idが「1」だと出品できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date 発送までの日数を選んでください")
      end
      it 'priceがないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下だと出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の範囲でご入力ください")
      end
      it 'priceが10000000以上だと出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の範囲でご入力ください")
      end
      it 'priceが全角数字では出品できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の範囲でご入力ください")
      end
      it 'priceが小数点を含む数字では出品できない' do
        @item.price = "7777.77"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の範囲でご入力ください")
      end
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end