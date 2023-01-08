class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination)
          .permit(:post, :prefecture_id, :city, :address, :building, :phone_number, :price)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if current_user == item.user || item.purchases.ids != []
      redirect_to root_path
    end
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
