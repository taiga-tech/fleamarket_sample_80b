class CardController < ApplicationController

  require "payjp"

  def create
  end

  def new
    card = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
    @year = Time.current
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_f47e2234a107e305901f65aa"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      # description: '登録テスト', #なくてもOK
      # email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "done"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show #Creditのデータpayjpに送り情報を取り出します
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = "sk_test_f47e2234a107e305901f65aa"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "delete"
    else
      Payjp.api_key = "sk_test_f47e2234a107e305901f65aa"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      # redirect_to action: "new"
  end
end

# def purchase
#   item = Item.find(params[:id])
#   card = Credit.where(user_id: current_user.id).first
#   Payjp.api_key = "sk_test_f47e2234a107e305901f65aa"
#   Payjp::Charge.create(
#     amount: item.price, # 決済する値段
#     # customer: card.customer_id,
#     card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
#     currency: 'jpy'
#   )

# end
