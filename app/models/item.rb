class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :goods, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id , presence: true
  validates :area_id, presence: true
  validates :days_deliver_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

end