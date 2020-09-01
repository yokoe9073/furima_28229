class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal, :exhibitor_prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :token

  validates :token, presence: true
  validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, presence: true
  validates :exhibitor_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :tel, format: { with: /[0-9]{,11}/, messege: '「-」は除いて下さい' }, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal: postal, exhibitor_prefecture_id: exhibitor_prefecture_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end
