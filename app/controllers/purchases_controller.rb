class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new(order_params)
  end

  def create
end
