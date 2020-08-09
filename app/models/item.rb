class Item < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  belongs_to :category
  has_many :comments 
  has_many :images
end
