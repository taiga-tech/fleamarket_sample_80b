class CardController < ApplicationController
  before_action :move_to_root
  before_action :set_card, only: [:new, :show, :destroy, :buy, :pay ]
  before_action :set_item, only: [:buy, :pay]

  require "payjp"

  def new
    # カード情報が登録されている場合
    if @card.present?
      redirect_to credit_path(current_user.id) #showアクションへ
    else
      card = Credit.where(user_id: current_user.id)
    end
  end

  def create
    # 秘密鍵を取得、payjpと照合
    Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to action: :new
    else
      # トークン発行後、payjp上で顧客データを生成
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id},
        description: 'test'
      )

      # railsのデータベース上にもカード情報とそれに紐づく顧客情報を保存
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save #保存ができたらカード登録完了ページへ遷移
        redirect_to regist_done_credits_path
      else
        redirect_to action: :new
      end
    end
  end

  def show
  end

  def buy
    card = Credit.where(user_id: current_user.id).first
    # カード登録できていなければ登録画面に遷移
    if @card.blank?
      redirect_to action: :new
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      # case @card_info.brand
      #   when "Visa"
      #     @card_src = ""
      #   when "JCB"
      #     @card_src = ""
      #   when "MasterCard"
      #     @card_src = ""
      #   when "American Express"
      #     @card_src = ""
      #   when "Diners Club"
      #     @card_src = ""
      # end
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    if Payjp::Charge.create(amount: @item.price, customer: customer, currency: 'jpy' )
      @item.update!(trading_status: "売却済")
    else
      # 商品購入画面に遷移
      render action: :buy
    end
  end

  private
  # ログインしていなければトップ画面に遷移
  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  # 各アクション内でuser_idとデータベースに保存されたcard情報を紐付ける
  def set_card
    @card = Credit.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
