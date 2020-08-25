require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FActoryBot.build(:item)
  end
  describe '商品出品機能' do
    context ' 商品出品がうまくいくとき' do
      it "出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば登録できる" do
        expect(item).to be_valid
      end
      it "商品画像があれば登録できる" do 
        expect(item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it "出品画像が空だと登録できない" do
        @item.image = ""
        @item.valid?
        expect(item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空では登録できない" do
        @item.status = ""
        @item.valid?
        expect(item.errors.full_messages).to include("Status can't be blank")
      end
      it "カテゴリーが"--"の場合登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が"--"の場合登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担が"--"の場合登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(item.errors.full_messages).to include("Delivery_fee can't be blank")
      end
      it "発送元の地域が"--"の場合登録できない" do
        @item.exhibitor_prefecture_id = 1
        @item.valid?
        expect(item.errors.full_messages).to include("Exhibitor_prefecture can't be blank")
      end
      it "発送までの日数が"--"の場合登録できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(item.errors.full_messages).to include("Shipping_date can't be blank")
      end  
      it "販売価格が空の場合登録できない" do
        @item.price = ""
        @item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が"300~9999999"の範囲外の場合登録できない" do
        @item.price = 100
        @item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が"300~9999999"の範囲外の場合登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end