class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_id: params[:item_id])
  end


end
