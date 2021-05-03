class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]


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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to action: :show
  else
    render :edit
  end
end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :status_id, :delivery_payment_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end


end
