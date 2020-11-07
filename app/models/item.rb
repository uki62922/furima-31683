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
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :condition
  belongs_to :postage
  belongs_to :days_deliver
  validates :category_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 }
  validates :days_deliver_id, numericality: { other_than: 1 }
end