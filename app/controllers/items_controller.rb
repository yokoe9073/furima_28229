class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
       redirect_to item_path
    else
       render :edit
    end
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

  def destroy
    item = Item.find(params[:id])
    if item.destroy 
       redirect_to action: :index
    else
       rander :edit  
    end
  end


  private
  def item_params
    params.require(:item).permit(:image,:name,:detail, :category_id, :status_id, :delivery_fee_id, :exhibitor_prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
