class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :prefecture_id, :city, :address, :buil, :tel;

  with_options presence: true do
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :city
  validates :address
  validates :tel,    format: { with: /\A\d{10}\z|\A\d{11}\z/}
end
  validates :prefecture_id,    numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, buil: buil, tel: tel, order_id: order.id)
  end
end