require 'rails_helper'
describe OrderShipping do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    @order_shipping = FactoryBot.build(:order_shipping)
    @order_shipping.item_id = @item.id
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
       it 'すべての値が正しく入力されていれば保存できる' do
         expect(@order_shipping).to be_valid
       end
       it 'building は空でも保存できること' do
         @order_shipping.building = ''
         expect(@order_shipping).to be_valid
       end
    end  
    context '購入がうまくいかないとき' do
       it 'カード情報が間違っていたら保存できないこと' do
         @order_shipping.token = ''
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("カード情報を入力してください")
       end
       it 'postal が空だと保存できないこと' do
         @order_shipping.postal = ''
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください")
       end
       it 'postal が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
         @order_shipping.postal = '1234567'
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("郵便番号はハイフン「-」と数字を入れて入力してください")
       end
       it 'exhibitor_prefecture_id を選択していないと保存できないこと' do
         @order_shipping.exhibitor_prefecture_id = 1
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("都道府県を選択してください")
       end
       it 'city が空だと保存できないこと' do
         @order_shipping.city = ''
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
       end
       it 'address が空だと保存できないこと' do
         @order_shipping.address = ''
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
       end
       it 'city が空だと保存できないこと' do
         @order_shipping.city = ''
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
       end
       it 'tel が空だと保存できないこと' do
         @order_shipping.tel = ''
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください")
       end
       it 'tel は "-"があると登録できないこと' do
         @order_shipping.tel = '1-2-3'
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages).to include("電話番号は半角数字のみで入力してください")
       end
       it '紐づくユーザーが存在しないと保存できない' do
         @order_shipping.user_id = nil
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages)
       end
       it '紐づく商品が存在しないと保存できない' do
         @order_shipping.item_id = nil
         @order_shipping.valid?
         expect(@order_shipping.errors.full_messages)
       end
    end
  end
end