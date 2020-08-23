class Item < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  belongs_to :category
  has_many   :buys#, dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :images, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :liked_users, through: :likes, source: :user
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
            :reservation_email,
            presence: true

  def self.search(search)
    if search
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.item_id) FROM likes where likes.item_id = items.id GROUP BY likes.item_id)'
    Arel.sql(query)
  end
end
