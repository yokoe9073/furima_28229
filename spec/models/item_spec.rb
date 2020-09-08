require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context ' 商品出品がうまくいくとき' do
      it "出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it "出品画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を選択してください")
      end
      it "商品名が空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品説明が空では登録できない" do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリーが選択されてない場合登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "商品の状態が選択されてない場合登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it "配送料の負担が選択されてない場合登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it "発送元の地域が選択されてない場合登録できない" do
        @item.exhibitor_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it "発送までの日数が選択されてない場合登録できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end  
      it "販売価格が空の場合登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "販売価格が300を下回った場合登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300~9,999,999の間で入力してください")
      end
      it "販売価格が9999999を上回った場合登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300~9,999,999の間で入力してください")
      end
    end
  end
end