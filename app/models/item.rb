class Item < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  belongs_to :category
  has_many :buys
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
