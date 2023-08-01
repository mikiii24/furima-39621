class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :item_info, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :price, presence: true
end
