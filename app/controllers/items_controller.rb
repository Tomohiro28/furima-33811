class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(
      :product_name,:price,:description,:category_id,:status_id,:shippingfee_id,:area_id,:shippingday_id
    ).merge(user_id: current_user.id)
  end
end
