class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :shipping_prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
  end
  validates :shipping_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :phone_number, length: { minimum: 10, message: 'is too short' }
  validates :phone_number, length: { maximum: 11, message: 'is too long' }

  def save
    return false unless valid?

    order = Order.create(item_id:, user_id:)
    Address.create(postal_code:, shipping_prefecture_id:, city:, addresses:,
                   building:, phone_number:, order_id: order.id)
    true
  end
end
