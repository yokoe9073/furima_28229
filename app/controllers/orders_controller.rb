class OrdersController < ApplicationController


 def index
  @item = Item.find(params[:item_id])
  @order = OrderShipping.new
 end

 def create
  @item = Item.find(params[:item_id])
  @order = OrderShipping.new(order_params)
  if @order.valid?
     pay_item
     @order.save
     return redirect_to root_path
  else
     render 'index'
  end
 end

 private

 def order_params
  params.permit(:postal, :exhibitor_prefecture_id, :city, :address, :building, :tel, :token).merge(user_id: current_user.id,item_id: @item.id)
 end

 def token_params
  params.permit(:token)
 end
 
 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
  @item = Item.find(params[:item_id])
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: token_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
 end
end