class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end  
  end

  # def priced
  #   item = Item.find(params[:id])
  #   price = Item.find(params[:id])
  #   rander json: { item: price }

  private
  def item_params
    params.require(:item).permit(:name, :image, :detail, :category_id, :status_id, :delivery_fee_id, :exhibitor_prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
