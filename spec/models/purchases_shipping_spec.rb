require 'rails_helper'

RSpec.describe  PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping,user_id: user.id,item_id: item.id)
  end
  
  describe "商品購入機能" do
    context "購入情報保存できるとき" do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_shipping).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchase_shipping.building = ""
        expect(@purchase_shipping).to be_valid
      end
    end

    context "購入情報保存できないとき" do
      it '郵便番号が空だと保存できない'do
        @purchase_shipping.post = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post can't be blank")
      end
      it '郵便番号はハイフンがないと保存できない' do
        @purchase_shipping.post = "1234567"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post is invalid")
      end
      it '都道府県が(--)だと保存できない' do
        @purchase_shipping.area_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area must be other than 1")
      end
      it '市町村が空だと保存できない' do
        @purchase_shipping.city = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @purchase_shipping.address = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @purchase_shipping.phone = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は12桁以上だと保存できない' do
        @purchase_shipping.phone = "123456789012"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空だと保存できない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
