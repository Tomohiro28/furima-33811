class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item,           only:   [:show,:edit,:update,:destroy]
  before_action :move_to_index,      only:   [:edit,:update,:destroy]
  before_action :sold_out_item,      only:   [:edit,:update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render  :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end 
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :product_name,:price,:description,:category_id,:status_id,:shippingfee_id,:area_id,:shippingday_id,:image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
      unless current_user.id == @item.user_id
        redirect_to root_path 
      end
  end

  def sold_out_item
    if @item.purchase.present?
      redirect_to root_path
    end
  end

end
