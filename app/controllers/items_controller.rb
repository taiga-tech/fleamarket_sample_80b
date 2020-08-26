class ItemsController < ApplicationController
  before_action :search
  before_action :detail

  before_action :authenticate_user!, except: [:index, :show, :search, :detail]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :reserved, :reserve, :reserve_cancel]

  before_action :set_categories, only: [:new, :create, :edit]
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @first = Item.includes(:user).order('created_at DESC').first(8).shuffle
    @categories = Category.includes(:items).where(ancestry: nil).shuffle.first(4)
    # @ladies = Item.where(category_id: 1..199).shuffle #.order('created_at DESC')
    # @mens = Item.where(category_id: 200..345).shuffle #.order('created_at DESC')
    # @home_appliances = Item.where(category_id: 898..983).shuffle #.order('created_at DESC')
    # @interiors = Item.where(category_id: 481..624).shuffle #.order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @like = Like.new
  end

  #商品出品
  def new
    @item = Item.new
    @item.images.new
  end

  #商品情報
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to item_path(@item)
    else
      render action: :new
    end
  end

  #商品編集
  def edit
    @category = @item.category #@itemの孫カテゴリー
    @child_category = @category.parent #@itemの子カテゴリー
    @grandparent_category = @category.root #@itemの親カテゴリー
    @child_categories = @grandparent_category.children
    @grandchild_categories = @child_category.children
  end

  def reserve
  end

  def reserved
    @item.update(item_params)
    if @item.reservation_email.present?
    else
      render :reserve
    end
  end

  def reserve_cancel
    if @item.update(reservation_email: "")
      redirect_to item_path
    else
      redirect_to item_path
    end
  end

  #商品更新機能
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

    # 子孫カテゴリー
    def get_category_children
      @category_children = Category.find(params[:parent_id]).children
    end

    def get_category_grandchildren
      @category_grandchildren = Category.find(params[:child_id]).children
    end

    # 配送料の負担
    def get_delivery_fee
      @delively_fee = Delivery.find(params[:delivery_id])
    end

  #商品削除
  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def detail
    if params[:q].present?
      # 検索フォームからアクセスした時の処理
        @detail = Item.ransack(detail_params)
        @items = @detail.result
      else
      # 検索フォーム以外からアクセスした時の処理
        params[:q] = { sorts: 'id desc' }
        @detail = Item.ransack()
        @items = Item.all
      end
  end

  # カテゴリー検索
  def category
    @categories = Category.where(id: params[:id])
    # @item = @categories.find(params[:id])
  end

  private

  def set_item
    @item = Item.includes(:comments).find(params[:id])
  end

  def set_categories
    @category_parents = Category.where(ancestry: nil)
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  # ストロングパラメータ
  def item_params
    params.require(:item).permit(
      :title,
      :price,
      :text,
      :stock,
      :brand,
      :condition,
      :shipping,
      :leadtime,
      :delivery_id,
      :category_id,
      :reservation_email,
      images_attributes:  [:image, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

  # def update_params
  #   params.require(:item).permit(
  #     :title,
  #     :price,
  #     :text,
  #     :stock,
  #     :brand,
  #     :condition,
  #     :leadtime,
  #     :delivery_id,
  #     :category_id,
  #     :reservation_email,
  #     images_attributes: [:image, :_destroy, :id]
  #   )
  # end

  def detail_params
    params.require(:q).permit(:sorts)
  end
end
