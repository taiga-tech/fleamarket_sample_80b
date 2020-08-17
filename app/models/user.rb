class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: {message: "が入力されていません"}

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one   :address
  has_many  :items#, dependent: :destroy
  has_many  :comments#, dependent: :destroy
  has_many :profiles
end
