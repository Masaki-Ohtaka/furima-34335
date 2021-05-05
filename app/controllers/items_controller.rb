class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:destroy, :edit, :update, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
    unless @item.user_id == current_user.id 
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
       redirect_to item_path
    else
       render :edit
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :item_description, :category_id, :condition_id, :delivery_id, :location_id, :item_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
