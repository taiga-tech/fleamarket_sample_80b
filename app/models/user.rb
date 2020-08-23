class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: {message: "が入力されていません"}

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one  :address
  has_many :items#, dependent: :destroy
  has_many :comments#, dependent: :destroy
  has_one  :profile
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  has_many :sns_credentials

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    user
  end
end
