class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    binding.pry  
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping).permit(:post,:area_id,:city,:address,:building,:phone)
    .merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
