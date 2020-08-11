class ItemsController < ApplicationController  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show 
    @comment = Comment.new
  end

  #商品出品
  def new
    if current_user
      @item = Item.new
      @item.images.new
    else
      redirect_to root_path
    end
  end

  #商品情報
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #商品編集
  def edit
  end

  #商品更新機能
  def update
    # if @item.update(product_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  #商品削除
  def destroy
  if @item.destroy
    redirect_to root_path
  end 
end 

  #ストロングパラメーター
  private
  def item_params
    params.require(:item).permit(
      :title,
      :price,
      :text,
      :stock,
      :brand,
      :condition,
      :leadtime,
      :delivery_id,
      :category_id,
      images_attributes:  [:image, :_destroy, :id],
    ).merge(user_id: current_user.id)
  end

  def set_item 
    @item = Item.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end 
end

