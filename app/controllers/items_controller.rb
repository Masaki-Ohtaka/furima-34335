class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item =Iteme.create(item_params)
  end
  
  private
  def item_params
    #ActiveHashからHash呼び出しが理解していないので要確認
    params.require(:item).permit(:image, :title, :item_description, :category_id, :item_condition_id, :shipping_change_id, :shipping_area_id, :days_to_ship_id, :price)
  end
end
