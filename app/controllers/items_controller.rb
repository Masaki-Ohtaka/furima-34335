class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item =Iteme.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = @item.user
      @items = @item.users
      #render "tweets/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end
  
  private
  def item_params
    #ActiveHashからHash呼び出しが理解していないので要確認
    params.require(:item).permit(:image, :title, :item_description, :category_id, :item_condition_id, :shipping_change_id, :shipping_area_id, :days_to_ship_id, :price)
  end
end
