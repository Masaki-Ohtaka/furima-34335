class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :location_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
