class Item < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  belongs_to :category
  has_many :buys
  has_many :comments 
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, length: { minimum: 1, maximum: 10 }
  validates :title, 
            :price, 
            :text, 
            :stock, 
            :condition, 
            :leadtime, 
            :category_id, 
            :user_id, 
            :delivery_id, 
            presence: true
end
