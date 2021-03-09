class PurchasesController < ApplicationController
  def index
    # binding.pry
    @purchase = PurchaseShipping.new(purchase_params)
  end

  def create
    binding.pry
    @purchase_shipping = PurchaseShipping.new(purchase_params)
  end

  private
  def purchase_params
    params.permit(:purchase_shipping).permit(:post,:area_id,:city,:address,:building,:phone)
    .merge(user_id: current_user.id)
  end
end
