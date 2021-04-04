class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :egit, :update]
  before_action :move_to_index, except: [:index, :show]

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
  end

  def edit
  end

  def update
    if @item.update_attributes(items_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :price,:category_id,:condition_id,:delivery_charge_id, :area_id, :days_to_ship_id,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
