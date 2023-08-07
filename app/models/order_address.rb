class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_prefecture_id, :city, :addresses, :building, :phone_number

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_prefecture

  validates :item_id
  validates :user_id
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipping_prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end