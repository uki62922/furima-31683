class Item < ApplicationRecord

  belongs_to       :user
  has_one          :order
  has_one_attached :image
  has_many         :comment

  with_options presence: true do
    validates :goods
    validates :item_text
    validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
    validates :image
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :condition
  belongs_to :postage
  belongs_to :days_deliver

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :area_id
    validates :condition_id 
    validates :postage_id
    validates :days_deliver_id
  end
end