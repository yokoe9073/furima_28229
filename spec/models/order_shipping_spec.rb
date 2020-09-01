require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入者情報の保存' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipping).to be_valid
    end
    
    it 'building は空でも保存できること' do
      @order_shipping.building = ""
      expect(@order_shipping).to be_valid
    end
    it 'カード情報が間違っていたら保存できないこと'
      @order_shipping.token = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("token can't be blank")
    end
    it 'postal が空だと保存できないこと' do
      @order_shipping.postal = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Postal can't be blank")
    end
    it 'postal が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_shipping.postal = '1234567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
    end
    it 'exhibitor_prefecture_id を選択していないと保存できないこと' do
      @order_shipping.exhibitor_prefecture_id = 1
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'city が空だと保存できないこと' do
      @order_shipping.city = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("City code can't be blank")
    end
    it 'address が空だと保存できないこと' do
      @order_shipping.address = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Address code can't be blank")
    end
    it 'tel が空だと保存できないこと' do
      @order_shipping.city = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Tel code can't be blank")
    end
    it 'tel が11桁以下でないと保存できないこと' do
      @order_shipping.tel = '123456789'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Tel code is invalid")
    end
    it 'tel は "-"があると登録できないこと' do
      @order_shipping.tel = '123-4567-8910'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Tel no need hyphen(-)")
    end


  end
end