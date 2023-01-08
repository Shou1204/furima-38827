require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
    sleep 0.03 #0.03秒待機、この記述がないとエラーになる
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'buildingが空でも登録できる' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end
      it '全ての項目が入力されていれば登録できる' do
        expect(@purchase_destination).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post空だと購入できない' do
        @purchase_destination.post = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post can't be blank")
      end
      it 'postは「-」を含んだ正しい形式でないと購入できない' do
        @purchase_destination.post = '1234-567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post 郵便番号は「ハイフン(-)」を含めた正しい形式でご入力ください")
      end
      it 'prefectureを選択していないと購入できない' do
        @purchase_destination.prefecture_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture 発送元の地域を選んでください")
      end
      it 'cityが空だと購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @purchase_destination.address = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number 電話番号は10桁から11桁で入力してください")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number 電話番号は10桁から11桁で入力してください")
      end
      it 'item_idが空だと保存できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だとと保存できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空だとと保存できない' do
        @purchase_destination.token = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end