class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :shipping_prefecture_id, :city, :addresses, :building, :phone_number

  validates :token, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipping_prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :phone_number, length: { minimum: 10, message: 'is too short'}
  validates :phone_number, length: { maximum: 11, message: 'is too long'}

  def save
    if valid?
      order = Order.create(item_id: item_id, user_id: user_id)
      Address.create(postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
      return true
    else
      return false
    end
  end
end