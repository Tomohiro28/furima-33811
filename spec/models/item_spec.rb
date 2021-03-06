require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品できるとき' do
      it 'product_name,price,description,category_id,status_id,shippingfee_id,area_id,shippingday_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品価格が300円以上なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '商品価格が9,999,999円以下なら出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '出品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが(--)だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が(--)だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担が(--)だと出品できない' do
        @item.shippingfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingfee must be other than 1")
      end
      it '発送元の地域が(--)だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it '発送までの日数が(--)だと出品できない' do
        @item.shippingfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingfee must be other than 1")
      end
      it '販売価格が空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が299円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it '販売価格が10,000,000円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it '販売価格が全角だと出品できない' do
        @item.price = "千円"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が半角英語だと登録できない' do
        @item.price = "senen"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
