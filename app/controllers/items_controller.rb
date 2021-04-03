class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  private

  def items_params
    params.require(:item).permit(:name, :description, :price,:category_id,:condition_id,:delivery_charge_id, :area_id, :days_to_ship_id,:image).merge(user_id: current_user.id)
  end

end
