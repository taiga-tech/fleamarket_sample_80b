class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :category_parents



  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  # ヘッダーカテゴリー用
  def category_parents
    @category_parents = Category.where(ancestry: nil)
  end

  private
# 以下を追記
  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer
    .permit(:sign_up, keys:
            [ :name,
              :family_name,
              :first_name,
              :family_name_kana,
              :first_name_kana,
              :birthday
            ])
  end

end
