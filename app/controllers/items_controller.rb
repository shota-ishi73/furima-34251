class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:edit, :update, :destroy]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
  if @item.update(item_params)
    redirect_to action: :show
  else
    render :edit
  end
end

def destroy
  if @item.destroy
    redirect_to root_path
  end
end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :status_id, :delivery_payment_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def redirect
    if @item.purchase.present? || current_user.id != @item.user_id
      redirect_to root_path
    end
  end

end
