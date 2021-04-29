class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Iteme.create(item_params)
  end
  
  private
  def item_params
    #アクティブハッシュのハッシュ呼び出しが理解していないので要確認
    params.require(:item).permit(:image, :title, :item_description, :category_id, :shipping_change_id, :days_to_ship_id, :price)
  end
end
