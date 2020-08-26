class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      return redirect_to action: :index
    else
      render :new
    end  
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:detail, :category_id, :status_id, :delivery_fee_id, :exhibitor_prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
